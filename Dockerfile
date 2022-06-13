FROM node:lts-alpine

RUN apk add --no-cache --update bash
RUN apk add --no-cache --update --virtual build git python3 make gcc g++
WORKDIR /polyfill

ARG POLYFILL_SERVICE_VERSION=4.49.4
ARG NODE_ENV='production'
ENV PORT 8801

RUN wget https://github.com/Financial-Times/polyfill-service/archive/v$POLYFILL_SERVICE_VERSION.tar.gz -P /tmp \
  && tar -xzf /tmp/v$POLYFILL_SERVICE_VERSION.tar.gz -C /polyfill/ --strip-components=1 \
  && rm -f /tmp/v$POLYFILL_SERVICE_VERSION.tar.gz

RUN npm ci --no-audit

RUN sed -i.bak -e 's,^node,exec node,' start_server.sh && \
	mv start_server.sh /bin/ && \
	chmod a+x /bin/start_server.sh && \
	apk del build

EXPOSE ${PORT}

CMD ["/bin/start_server.sh", "server/index.js"]
# Use to debug if things don't start:
# CMD ["/bin/sh", "-c", "sleep 3600"]
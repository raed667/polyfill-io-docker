# Self-hosted Polyfill.io Docker Image

A very simple project to self-host your own Polyfill.io Docker image.


[![Get latest polyfill.io version](https://github.com/raed667/polyfill-io-docker/actions/workflows/get-latest-polyfill-version.yml/badge.svg)](https://github.com/raed667/polyfill-io-docker/actions/workflows/get-latest-polyfill-version.yml) [![Build Docker](https://github.com/raed667/polyfill-io-docker/actions/workflows/build-docker.yml/badge.svg)](https://github.com/raed667/polyfill-io-docker/actions/workflows/build-docker.yml)

Check it out on Docker Hub https://hub.docker.com/r/raed667/polyfill-io

```sh
docker pull raed667/polyfill-io
```

## Developers

This project consists for 3 parts:

1- A `Dockerfile` that downloads a tagged version from [https://github.com/Financial-Times/polyfill-service](https://github.com/Financial-Times/polyfill-service) and creates a service using `node:lts-alpine` as a base image.

2- A Github Action `Get latest polyfill.io version` that runs on a given interval to check the latest released version of the polyfill.io project.

3- A Github Action `Build and Publish Docker Image` that only triggers when the previous action detects a new polyfill.io version.

## License

M.I.T

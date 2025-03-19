# ci-jfrog-runner

A container that contains the JFrog CLI tool for use in automation


## Building the Container

A standard `Dockerfile` is provided and can be built with basic `docker build` commands


## Build Arguments

The `Dockerfile` defines two build arguments that can, and should, be defined at build time.

| Argument Name           | Default  | Description                                                                   |
| ----------------------- | -------- | ----------------------------------------------------------------------------- |
| JFROG_PLATFORM_BASE_URL | `_None_` | Defines the base URL to the JFrog platform to configure as the default target |
| PLATFORM_TOOLS_VERSION  | `1.0.17` | The specific version of `platform-tools` to install                           |

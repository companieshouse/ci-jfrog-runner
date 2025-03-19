FROM amazonlinux:2023

ARG JFROG_PLATFORM_BASE_URL
ARG PLATFORM_TOOLS_VERSION="1.0.17"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV JFROG_CLI_REPORT_USAGE=false

RUN dnf -y update && \
    dnf clean all

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    dnf install -y yum-utils && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    dnf install -y "platform-tools-terraform-${PLATFORM_TOOLS_VERSION}" && \
    dnf clean all

RUN curl -sfL https://install-cli.jfrog.io | sh && \
    jf c add \
        --interactive=false \
        --url="${JFROG_PLATFORM_BASE_URL}" \
        --artifactory-url="${JFROG_PLATFORM_BASE_URL}/artifactory" \
        ch-jfrog

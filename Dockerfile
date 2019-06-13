FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ARG VERSION=2.6.0
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates=20180409 git=1:2.17.1-1ubuntu0.4 openssh-client=1:7.6p1-4 vim-nox=2:8.0.1453-1ubuntu1 jq=1.5+dfsg-2 curl=7.58.0-2ubuntu3.6 && rm -rf /var/lib/apt/lists/*
RUN curl -SL "https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz" | tar xvz --strip-components 1 -C /tmp/
RUN mv /tmp/bin/* /usr/local/bin/
RUN curl -s "https://raw.githubusercontent.com/zaquestion/lab/master/install.sh" | bash

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "gitlab" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "GitLab CLI" \
    org.label-schema.description = "Lab wraps Git or Hub, making it simple to clone, fork, and interact with repositories on GitLab" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/gitlab" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/gitlab/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/gitlab" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/gitlab" \
    org.label-schema.vcs-ref = "${vcs_ref}" \
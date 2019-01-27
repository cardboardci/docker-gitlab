FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ARG VERSION=2.6.0
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates=20180409 git=1:2.17.1-1ubuntu0.4 openssh-client=1:7.6p1-4ubuntu0.1 vim-nox=2:8.0.1453-1ubuntu1 jq=1.5+dfsg-2 curl=7.58.0-2ubuntu3.5 && rm -rf /var/lib/apt/lists/*
RUN curl -SL "https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz" | tar xvz --strip-components 1 -C /tmp/
RUN mv /tmp/bin/* /usr/local/bin/
RUN curl -s "https://raw.githubusercontent.com/zaquestion/lab/master/install.sh" | bash
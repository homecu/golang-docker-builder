FROM centos:7.6.1810

ENV GOLANG_VERSION 1.12.9
ENV GOLANG_ARCH linux-amd64
ENV GOLANG_CSUM ac2a6efcc1f5ec8bdc0db0a988bb1d301d64b6d61b7e8d9e42f662fbb75a2b9b

ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN set -x \
    && yum -y update \
    && yum -y groups install "Development Tools" \
    && curl -fsL "https://golang.org/dl/go${GOLANG_VERSION}.${GOLANG_ARCH}.tar.gz" -o go.tar.gz \
    && echo "${GOLANG_CSUM}  go.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/local/go \
    && tar -zxf go.tar.gz -C /usr/local/go --strip-components=1 \
    && rm go.tar.gz \
    && mkdir -p /go/src/

WORKDIR /go/src

FROM centos:7.3.1611

ENV GOLANG_VERSION 1.8.3
ENV GOLANG_ARCH linux-amd64
ENV GOLANG_CSUM 1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772
ENV GOROOT /usr/local/go

RUN set -x \
    && yum -y update \
    && yum -y groups install "Development Tools" \
    && curl -fsL "https://golang.org/dl/go${GOLANG_VERSION}.${GOLANG_ARCH}.tar.gz" -o go.tar.gz \
    && echo "${GOLANG_CSUM}  go.tar.gz" | sha256sum -c - \
    && mkdir -p ${GOROOT} \
    && tar -zxf go.tar.gz -C ${GOROOT} --strip-components=1 \
    && rm go.tar.gz

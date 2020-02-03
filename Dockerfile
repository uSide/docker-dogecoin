FROM debian:stable-slim

ENV DOGECOIN_VERSION=1.14.2
ENV DOGECOIN_CHECKSUM=10c400c8f2039b1f804b8a533266201a9e4e3b32a8854501e8a43792e1ee78e6

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${DOGECOIN_CHECKSUM} dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp dogecoin-${DOGECOIN_VERSION}/bin/dogecoind /usr/local/bin \
    && rm -rf dogecoin-${DOGECOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/dogecoind"]

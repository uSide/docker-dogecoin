FROM debian:stable-slim

ENV DOGECOIN_VERSION=1.14.0
ENV DOGECOIN_CHECKSUM=ed7baccafab98b5ce452bd3fd2cf7ab5e757269105350283e2bab91e4ccb7366

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${DOGECOIN_CHECKSUM} dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp dogecoin-${DOGECOIN_VERSION}/bin/dogecoind /usr/local/bin \
    && rm -rf dogecoin-${DOGECOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/dogecoind"]

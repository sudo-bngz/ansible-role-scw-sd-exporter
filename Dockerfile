FROM alpine:3.18
ARG SCW_SD_VERSION=v0.1.0
ARG SCW_SD_OS=linux
ARG SCW_SD_ARCH=amd64
RUN apk add --no-cache ca-certificates curl \
    && curl -L "https://github.com/sudo-bngz/dedibox-sd/releases/download/${SCW_SD_VERSION}/scw-sd-${SCW_SD_OS}-${SCW_SD_ARCH}" -o /usr/local/bin/scw-sd \
    && chmod +x /usr/local/bin/scw-sd \
    && apk del curl
USER nobody
ENV ONLINE_API_TOKEN=
ENTRYPOINT ["/usr/local/bin/scw-sd"]

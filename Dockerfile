FROM python:3-alpine

ENV RADICALE_VERSION 2.1.11

RUN \
    set -e \
	&& addgroup -S radicale \
	&& adduser -S -D -H -s /sbin/nologin -G radicale radicale \
    && apk add --no-cache \
        su-exec \
    && pip install Radicale==${RADICALE_VERSION}

COPY ./container-data /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["radicale", "--config", "/etc/radicale.cfg"]

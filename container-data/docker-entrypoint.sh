#!/usr/bin/env sh

[ -d /radicale ] \
    && chown -R radicale /radicale

exec su-exec radicale ${@}

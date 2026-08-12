#!/bin/sh
export SIGN_CERT="${SIGN_CERT:-/etc/unblockneteasemusic/server.crt}"
export SIGN_KEY="${SIGN_KEY:-/etc/unblockneteasemusic/server.key}"
exec /usr/bin/node --disable-warning=DEP0169 /usr/lib/unblockneteasemusic/app.js "$@"

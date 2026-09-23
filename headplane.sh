#!/bin/sh
cd /usr/share/headplane || exit 1
exec /usr/bin/node /usr/share/headplane/build/server/index.js "$@"

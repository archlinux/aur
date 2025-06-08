#!/bin/sh
cd /usr/lib/tithon
export NODE_ENV=production
exec electron /usr/lib/tithon/main.js "$@"

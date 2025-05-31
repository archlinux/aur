#!/bin/sh -eu

export NODE_ENV=production
exec electron@_electronver@ /usr/lib/gridtracker2/resources/app.asar "$@"

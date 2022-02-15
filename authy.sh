#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron9 /usr/lib/authy/app.asar --no-sandbox "$@"

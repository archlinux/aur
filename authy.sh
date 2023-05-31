#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron24 /usr/lib/authy/app.asar "$@"

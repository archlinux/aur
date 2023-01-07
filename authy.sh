#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron22 /usr/lib/authy/app.asar "$@"

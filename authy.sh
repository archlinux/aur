#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron20 /usr/lib/authy/app.asar "$@"

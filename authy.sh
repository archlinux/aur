#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron@ELECTRONVERSION@ /usr/lib/authy/app.asar "$@"

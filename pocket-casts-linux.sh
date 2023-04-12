#!/bin/sh

export ELECTRON_IS_DEV=0
exec @ELECTRON@ /usr/lib/pocket-casts-linux/app.asar "$@"

#!/bin/sh

LD_PRELOAD=/usr/lib/libsqlcipher.so exec @ELECTRON@ /usr/lib/element/app.asar --disable-dev-mode "$@"

#!/bin/sh

LD_PRELOAD=/usr/lib/libsqlcipher.so exec @ELECTRON@ /usr/lib/schildichat-desktop/resources/app.asar --disable-dev-mode "$@"

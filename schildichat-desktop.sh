#!/bin/sh

exec @ELECTRON@ /usr/lib/schildichat-desktop/app.asar --disable-dev-mode "$@"

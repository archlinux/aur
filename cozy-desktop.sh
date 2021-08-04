#!/bin/sh

exec @ELECTRON@ /usr/lib/cozy-desktop/app.asar --disable-dev-mode "$@"

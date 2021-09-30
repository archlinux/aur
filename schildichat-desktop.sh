#!/bin/sh

exec @ELECTRON@ /usr/lib/schildichat-desktop/resources/app.asar --disable-dev-mode "$@"

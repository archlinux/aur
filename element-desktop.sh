#!/bin/sh

exec @ELECTRON@ /usr/lib/element/app.asar --disable-dev-mode "$@"

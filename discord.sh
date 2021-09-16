#!/bin/sh
exec @ELECTRON@ /opt/discord-electron/app.asar --disable-dev-mode "$@"

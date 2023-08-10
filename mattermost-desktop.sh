#!/bin/sh
exec @ELECTRON@ /usr/lib/mattermost-desktop/app.asar --disable-dev-mode "$@"

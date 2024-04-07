#!/bin/sh
export TW_DIST_ID=linux-aur # appears as "distribution" in about menu
exec electron29 /usr/share/turbowarp-desktop/app.asar "$@"

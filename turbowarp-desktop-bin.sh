#!/bin/sh
# appears as "distribution" in ? > about menu
export TW_DIST_ID=linux-aur
# disable in-app update checker as updates are managed by the AUR package
export TW_DISABLE_UPDATE_CHECKER=1
exec electron29 /usr/share/turbowarp-desktop/app.asar "$@"

#!/bin/sh
# APPIMAGE prevents electron-updater loading hang
export APPIMAGE=1
exec electron41 --require /usr/lib/rotki/resources-path.cjs /usr/lib/rotki/app.asar "$@"

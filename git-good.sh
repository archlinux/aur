#!/bin/bash
_ELECTRON=/usr/bin/electron25
APPDIR="/usr/lib/git-good"
export PATH="${APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/swiftshader:${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec --enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland ${_ELECTRON} ${_ASAR} "$@"
else
    exec --enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
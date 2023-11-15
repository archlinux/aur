#!/bin/bash
_ELECTRON=/usr/bin/electron22
APPDIR="/usr/lib/kui"
export PATH="${APPDIR}:${PATH}"
export KUI_POPUP_WINDOW_RESIZE=true
#export LD_LIBRARY_PATH="${APPDIR}/swiftshader:${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} kubectl "$@"
else
    exec ${_ELECTRON} ${_ASAR} kubectl --no-sandbox "$@"
fi
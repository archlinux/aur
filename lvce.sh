#!/bin/bash
_ELECTRON=/usr/bin/electron27
APPDIR="/opt/lvce"
export PATH="${APPDIR}:${PATH}"
_ASAR="${APPDIR}/resources/app"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
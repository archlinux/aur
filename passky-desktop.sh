#!/bin/bash
_ELECTRON=/usr/bin/electron23
APPDIR="/usr/lib/passky-desktop"
export PATH="${APPDIR}:${PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
#!/bin/bash
_ELECTRON=/usr/bin/electron22
APPDIR="/usr/lib/icalingua++"
export PATH="${APPDIR}:${PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} --dha "$@"
else
    exec ${_ELECTRON} ${_ASAR} --dha --no-sandbox "$@"
fi
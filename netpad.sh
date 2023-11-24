#!/bin/bash
_ELECTRON=/usr/bin/electron23
APPDIR="/usr/lib/netpad"
export PATH="${APPDIR}:${APPDIR}/bin:${PATH}"
#export LD_LIBRARY_PATH="${APPDIR}/lib":"${APPDIR}/swiftshader":"${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
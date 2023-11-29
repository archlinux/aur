#!/bin/bash
APPDIR="/usr/lib/waveterm"
export PATH="${APPDIR}:${PATH}"
#export LD_LIBRARY_PATH="${APPDIR}/lib:${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    cd $APPDIR
    exec electron@electronversion@ ${_ASAR} "$@"
else
    cd $APPDIR
    exec electron@electronversion@ --no-sandbox "$@"
fi
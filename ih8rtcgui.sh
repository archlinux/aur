#!/bin/bash
APPDIR="/usr/lib/@appname@"
export PATH="${APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/swiftshader:${APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
_ASAR="${APPDIR}/@asar@"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    cd "$APPDIR"
    exec electron@electronversion@ ${_ASAR} "$@"
else
    cd "$APPDIR"
    exec electron@electronversion@ ${_ASAR} --no-sandbox "$@"
fi
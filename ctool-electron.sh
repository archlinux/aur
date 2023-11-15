#!/bin/bash
_ELECTRON=/usr/bin/electron26
_ENV="env JSC_useDFGJIT=0"
APPDIR="/usr/lib/ctool-electron"
export PATH="${APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/swiftshader:${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ENV} ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ENV} ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
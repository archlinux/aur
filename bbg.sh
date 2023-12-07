#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
export PATH="${_APPDIR}:${PATH}"
export ELECTRON_IS_DEV=0
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
_ASAR="${_APPDIR}/@appasar@"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    cd "${_APPDIR}"
    exec electron@electronversion@ "${_ASAR}" "$@"
else
    cd "${_APPDIR}"
    exec electron@electronversion@ "${_ASAR}" --no-sandbox "$@"
fi
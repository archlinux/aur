#!/bin/sh
set -e
_APPDIR="/usr/lib/@appname@"
_ASAR="${_APPDIR}/@appasar@"
_ENV="env JSC_useDFGJIT=0"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export NODE_ENV=production
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    cd "${_APPDIR}"
    "${_ENV}" exec electron@electronversion@ "${_ASAR}" "$@"
    exit
else
    cd "${_APPDIR}"
    "${_ENV}" exec electron@electronversion@ "${_ASAR}" --no-sandbox "$@"
    exit
fi
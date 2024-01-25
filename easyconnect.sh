#!/bin/sh
set -e
_APPDIR=/usr/share/@appname@/@runpath@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${_APPDIR}/resources/lib64:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export NODE_ENV=production
cd "${_APPDIR}"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec "${_RUNNAME}" "$@" || exit $?
else   
    exec "${_RUNNAME}" --no-sandbox "$@" || exit $?
fi
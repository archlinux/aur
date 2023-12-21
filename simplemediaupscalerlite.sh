#!/bin/sh
set -e
_APPDIR="/usr/lib/@appname@"
_ASAR="${_APPDIR}/@appasar@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib-dynload:${_APPDIR}/bin/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export NODE_ENV=production
cd "${_APPDIR}"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron@electronversion@ "${_ASAR}" "$@" || exit
else
    exec electron@electronversion@ "${_ASAR}" --no-sandbox "$@" || exit
fi
#!/bin/sh
set -e
_APPDIR="/usr/lib/@appname@"
_ASAR="${_APPDIR}/@appasar@"
_OPTS="--ms-enable-electron-run-as-node"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export NODE_ENV=production
cd "${_APPDIR}"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron@electronversion@ "${_ASAR}" "${_OPTS}" "$@" || exit $?
else
    exec electron@electronversion@ "${_ASAR}" "${_OPTS}" "$@" || exit $?
fi
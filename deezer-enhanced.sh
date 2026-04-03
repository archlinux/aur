#!/bin/bash

set -e
_APPDIR="/usr/lib/@appname@"
_OPTIONS="@options@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export ELECTRON_ENABLE_LOGGING=true
export NODE_ENV=production

cd "${_APPDIR}"
if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    exec electron@electronversion@ "${_APPDIR}" "${_OPTIONS}" "$@" || exit $?
else
    exec electron@electronversion@ "${_APPDIR}" "${_OPTIONS}" --no-sandbox "$@" || exit $?
fi

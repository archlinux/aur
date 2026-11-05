#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}/bin:${_APPDIR}/lib/runtime/bin:${_APPDIR}/lib/app/Library${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib:${_APPDIR}/lib/runtime/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
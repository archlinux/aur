#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNAPP="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNAPP}" "$@" || exit $?
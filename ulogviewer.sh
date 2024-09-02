#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export LC_CTYPE=en_US.UTF-8
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
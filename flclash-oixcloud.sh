#!/bin/bash
set -o pipefail

_APPDIR="/opt/flclash-oixcloud"
_RUNNAME="${_APPDIR}/flclash-oixcloud"

export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?

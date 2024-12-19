#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
if wmctrl -l | grep -q 'Linux Assistant'; then
    exec wmctrl -a 'Linux Assistant'
else
    exec "${_APPDIR}/@runname@" "$@"
fi
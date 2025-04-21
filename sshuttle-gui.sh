#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib/x86_64-linux:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
if [[ "$(type -p kdesu)" && "${XDG_CURRENT_DESKTOP}" == KDE ]]; then
    kdesu "${_RUNNAME}" "$@" || exit $?
else
    pkexec "${_RUNNAME}" "$@" || exit $?
fi
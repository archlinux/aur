#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH:-}"
export WX_MODULE_DIRS="modules_ext;~/Wonkey Modules/"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
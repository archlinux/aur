#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
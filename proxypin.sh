#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}/lib:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
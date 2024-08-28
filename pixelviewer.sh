#!/bin/bash
set -o pipefail
_APPDIR=/usr/lib/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export LC_CTYPE=en_US.UTF-8
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export LC_CTYPE=en_US.UTF-8
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
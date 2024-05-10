#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${LD_LIBRARY_PATH}"
export LC_CTYPE=en_US.UTF-8
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
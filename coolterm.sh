#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/${_APPNAME} Libs":"${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
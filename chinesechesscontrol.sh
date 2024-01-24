#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/bin:${_APPDIR}/lib:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
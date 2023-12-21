#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib-dynload:${_APPDIR}/bin/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit
#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/rt/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/rt/lib:${_APPDIR}/rt/lib/jli:${_APPDIR}/rt/lib/server:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
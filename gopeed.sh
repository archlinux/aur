#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNAPP=@runname@
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}" "$@"
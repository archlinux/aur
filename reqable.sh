#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNAPP="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
exec "${_RUNAPP}" "$@"
exit
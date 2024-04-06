#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export _PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export XDG_RUNTIME_DIR="${_APPDIR}/lib:${XDG_RUNTIME_DIR}"
export QT_PLUGIN_PATH="${_APPDIR}/lib:${QT_PLUGIN_PATH}"
export RUNLEVEL=3
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
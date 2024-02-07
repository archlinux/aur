#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/charset_normalizer:${_APPDIR}/lib_dynload:${_APPDIR}/PyQt6:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/PyQt6/Qt6/plugins:${QT_PLUGIN_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
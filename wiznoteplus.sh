#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
export QT_QPA_PLATFORM_PLUGIN_PATH="${_APPDIR}/plugins:${QT_QPA_PLATFORM_PLUGIN_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
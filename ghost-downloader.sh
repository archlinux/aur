#!/bin/bash
set -o pipefail
_APPDIR=/usr/lib/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/PySide6/qt-plugins:${QT_PLUGIN_PATH:-}"
export QT_QPA_PLATFORMTHEME="gtk2"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
#!/bin/bash
set -euo pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/PyQt5:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/PyQt5/Qt/plugins:${QT_PLUGIN_PATH}"
export QT_QPA_PLATFORM_PLUGIN_PATH="${_APPDIR}/PyQt5/Qt/plugins:${QT_QPA_PLATFORM_PLUGIN_PATH}"
export QML_IMPORT_PATH="${_APPDIR}/PyQt5/Qt/qml:${QML_IMPORT_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/PyQt5/Qt/qml:${QML2_IMPORT_PATH}"
export QT_QPA_PLATFORM=xcb
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
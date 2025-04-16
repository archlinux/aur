#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAM="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/qml:${QML2_IMPORT_PATH}"
export QTWEBENGINE_DISABLE_SANDBOX=1
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAM}" "$@" || exit $?
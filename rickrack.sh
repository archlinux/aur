#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/PyQt5:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/PyQt5/Qt/plugins:${QT_PLUGIN_PATH}"
export QT_QPA_PLATFORM_PLUGIN_PATH="${_APPDIR}/PyQt5/Qt/plugins:${QT_QPA_PLATFORM_PLUGIN_PATH}"
export QML_IMPORT_PATH="${_APPDIR}/PyQt5/Qt/qml:${QML_IMPORT_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/PyQt5/Qt/qml:${QML2_IMPORT_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/bin/@appname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
export QML_IMPORT_PATH="${_APPDIR}/qml:${QML_IMPORT_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/qml:${QML2_IMPORT_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?
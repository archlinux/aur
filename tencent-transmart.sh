#!/bin/bash
APPDIR=/opt/tencent-transmart
export LD_LIBRARY_PATH="${APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${APPDIR}/plugins:${QT_PLUGIN_PATH}"
export QML2_IMPORT_PATH="${APPDIR}/qml:${QML2_IMPORT_PATH}"
export QTWEBENGINE_DISABLE_SANDBOX=1
exec "${APPDIR}/TranSmart" --no-sandbox %U


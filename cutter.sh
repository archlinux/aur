#!/bin/bash

APPDIR="/usr/lib/cutter"

export APPDIR
export PATH="$APPDIR/usr/bin:$PATH"
export LD_LIBRARY_PATH="$APPDIR/usr/lib:$APPDIR/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
export XDG_DATA_DIRS="$APPDIR/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export PYTHONPATH="$APPDIR/usr/lib/python3.12/dist-packages:$PYTHONPATH"
export QT_PLUGIN_PATH="$APPDIR/usr/lib/qt/plugins:$QT_PLUGIN_PATH"
export QML2_IMPORT_PATH="$APPDIR/usr/lib/qt/qml:$QML2_IMPORT_PATH"

exec "$APPDIR/AppRun" "$@"

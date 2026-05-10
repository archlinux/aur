#!/bin/bash

BASE_DIR="/opt/shamela"
APP_BIN_DIR="$BASE_DIR/app/linux/64/bin"

cd "$BASE_DIR" || exit

exec env LD_LIBRARY_PATH="$APP_BIN_DIR:$LD_LIBRARY_PATH" \
         QT_API=pyside2 \
         QT_QPA_PLATFORM=xcb \
         QT_STYLE_OVERRIDE="fusion" \
         "$APP_BIN_DIR/shamela" "$@"
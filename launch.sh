#!/bin/bash

BASE_DIR="$(dirname "$(realpath "$0")")"
APP_BIN_DIR="$BASE_DIR/app/linux/64/bin"

cd "$BASE_DIR" || exit

exec env -u XDG_CURRENT_DESKTOP \
         -u XDG_SESSION_DESKTOP \
         -u DESKTOP_SESSION \
         -u KDE_FULL_SESSION \
         -u KDE_SESSION_VERSION \
         -u GNOME_DESKTOP_SESSION_ID \
         -u MATE_DESKTOP_SESSION_ID \
         -u CINNAMON_VERSION \
         -u LXQT_SESSION_VERSION \
         LD_LIBRARY_PATH="$APP_BIN_DIR:$LD_LIBRARY_PATH" \
         QT_API=pyside2 \
         QT_QPA_PLATFORM=xcb \
         QT_STYLE_OVERRIDE="fusion" \
         QT_QPA_PLATFORMTHEME="" \
         PYTHONUTF8=1 \
         PYTHONIOENCODING=utf-8 \
         LANG=C.UTF-8 \
         LC_ALL=C.UTF-8 \
         "$APP_BIN_DIR/shamela" "$@"
#!/bin/sh

export DESKTOPINTEGRATION=false
# Fix ffmpeg library detection with the AppImage
export LD_PRELOAD=/usr/lib/libdbus-1.so

INSTALL_DIR="/opt/musescore-bin"

exec "$INSTALL_DIR/musescore-bin.AppImage" "$@"

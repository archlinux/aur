#!/bin/sh

export DESKTOPINTEGRATION=false
# Fix ffmpeg library detection with the AppImage
export LD_PRELOAD=/usr/lib/libsystemd.so.0

INSTALL_DIR="/opt/musescore-bin"

exec "$INSTALL_DIR/musescore-bin.AppImage" "$@"

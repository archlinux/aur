#!/usr/bin/sh

INSTALL_DIR="/opt/davinci-resolve"
export LD_LIBRARY_PATH="$INSTALL_DIR/libs:$LD_LIBRARY_PATH"
exec "$INSTALL_DIR/DaVinci Control Panels Setup/DaVinci Control Panels Setup" "$@"

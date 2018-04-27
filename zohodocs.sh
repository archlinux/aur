#!/bin/sh
BINPATH="/opt/zohodocs"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export LD_LIBRARY_PATH="$BINPATH"
exec "$BINPATH"/zohodocsd "$@"

#!/bin/sh
BINPATH="/opt/zohodocs"
export LD_LIBRARY_PATH="$BINPATH"
exec "$BINPATH"/zohodocsd "$@"

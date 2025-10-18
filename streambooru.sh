#!/bin/sh
set -e

APPDIR="/opt/streambooru-bin"
BIN=""

if [ -x "$APPDIR/streambooru" ]; then
  BIN="$APPDIR/streambooru"
elif [ -x "$APPDIR/StreamBooru" ]; then
  BIN="$APPDIR/StreamBooru"
else
  echo "StreamBooru binary not found in $APPDIR" >&2
  exit 1
fi

# Wayland/X11 auto; user can override
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Optional flags: STREAMBOORU_FLAGS="--ozone-platform-hint=x11"
EXTRA_FLAGS="${STREAMBOORU_FLAGS:-}"

cd "$APPDIR"
exec "$BIN" $EXTRA_FLAGS "$@"

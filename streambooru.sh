#!/bin/sh
set -e

APPDIR="/opt/streambooru-bin"
BIN=""

# Support both lowercase and capitalized Electron binary names
if [ -x "$APPDIR/streambooru" ]; then
  BIN="$APPDIR/streambooru"
elif [ -x "$APPDIR/StreamBooru" ]; then
  BIN="$APPDIR/StreamBooru"
else
  echo "StreamBooru binary not found in $APPDIR" >&2
  exit 1
fi

# Wayland/X11 auto selection; user can override
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Allow users to pass extra flags (e.g., STREAMBOORU_FLAGS="--ozone-platform-hint=x11")
EXTRA_FLAGS="${STREAMBOORU_FLAGS:-}"

exec "$BIN" $EXTRA_FLAGS "$@"

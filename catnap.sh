#!/bin/env bash

SOURCE="/etc/catnap"
TARGET="$HOME/.config/catnap"
REAL_BIN="/usr/libexec/catnap-bin"

if [ ! -d "$TARGET" ]; then
  mkdir -p "$TARGET"
  cp -n "$SOURCE"/*.toml "$TARGET/" 2>/dev/null
fi

exec "$REAL_BIN" "$@"

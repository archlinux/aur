#!/usr/bin/env bash
set -euo pipefail

LIB_DIR="/usr/lib/easycliproxyapi"
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/easycliproxyapi"

mkdir -p "$USER_DIR/cpa-core"

# Check if initial sync or update from /usr/lib is needed
if [ ! -f "$USER_DIR/EasyCLIProxyAPI" ] || [ "$LIB_DIR/EasyCLIProxyAPI" -nt "$USER_DIR/EasyCLIProxyAPI" ]; then
    cp -f "$LIB_DIR/EasyCLIProxyAPI" "$USER_DIR/EasyCLIProxyAPI"
    chmod 755 "$USER_DIR/EasyCLIProxyAPI"
    cp -f "$LIB_DIR/core-version.txt" "$USER_DIR/core-version.txt"
    cp -f "$LIB_DIR/portable-app.json" "$USER_DIR/portable-app.json"
    if [ -d "$LIB_DIR/cpa-core" ]; then
        for f in "$LIB_DIR"/cpa-core/*; do
            if [ -f "$f" ]; then
                dest="$USER_DIR/cpa-core/$(basename "$f")"
                if [ ! -f "$dest" ] || [ "$f" -nt "$dest" ]; then
                    cp -f "$f" "$dest"
                fi
            fi
        done
    fi
    chmod -R u+w "$USER_DIR"
fi

cd "$USER_DIR"
exec "$USER_DIR/EasyCLIProxyAPI" "$@"

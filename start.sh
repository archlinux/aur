#!/bin/bash
set -e

# Get the directory of this script
SCRIPT_DIR="/opt/input"
ELECTRON_BIN="$SCRIPT_DIR/node_modules/.bin/electron"
SANDBOX="$SCRIPT_DIR/node_modules/electron/dist/chrome-sandbox"

# Launch the app
"$ELECTRON_BIN" "$SCRIPT_DIR"

#!/bin/bash

export TERM="${TERM:-xterm-256color}"
# Define user-specific directory for application state
export THREADSTEPPER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/threadstepper"

# Create directories if they don't exist
mkdir -p "$THREADSTEPPER_DIR"

# Copy structure to user dir, preserving updates but not overriding user's newer files
cp -ru /opt/threadstepper/* "$THREADSTEPPER_DIR/" 2>/dev/null || true

# Change to the user's directory before launching
cd "$THREADSTEPPER_DIR" || exit 1
exec python3 start.py "$@"

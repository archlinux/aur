#!/usr/bin/env bash
# Mistral Vibe Launcher Wrapper
# Ensures proper HOME and config directory access

set -euo pipefail

# Determine the binary name from how this script was called
SCRIPT_NAME=$(basename "$0")

# Path to the actual binary
VIBE_BIN="/opt/mistral-vibe/vibe-acp"

# Execute with all arguments passed through
exec "$VIBE_BIN" "$@"

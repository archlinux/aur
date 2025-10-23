#!/usr/bin/env bash
set -euo pipefail

# Run LyricBridge via system Electron and spawn backend automatically.
# Uses the dev-server script which starts uvicorn on a free port or uses an existing backend if LYRICBRIDGE_BACKEND_URL is set.

APPDIR="/usr/lib/lyricbridge"
FRONTEND_DIR="${APPDIR}/frontend"
SCRIPT="${FRONTEND_DIR}/scripts/dev-server.mjs"

# Wayland hint (optional)
export ELECTRON_OZONE_PLATFORM_HINT="auto"

exec node "${SCRIPT}"

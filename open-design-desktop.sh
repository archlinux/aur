#!/usr/bin/env bash
set -euo pipefail

# Ensure default runtime data directory is user-writable under XDG
if [[ -z "${OD_DATA_DIR:-}" ]]; then
  export OD_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/open-design"
fi

exec /opt/open-design-desktop/appdir/AppRun "$@"

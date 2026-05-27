#!/usr/bin/env bash
set -euo pipefail

APP="/opt/termcanvas/termcanvas"
ELECTRON_BIN="/usr/bin/electron"
ELECTRON_MAIN="/opt/termcanvas/dist-electron/main.js"

if [ -x "${ELECTRON_BIN}" ] && [ -f "${ELECTRON_MAIN}" ]; then
  exec "${ELECTRON_BIN}" "${ELECTRON_MAIN}" "$@"
elif [ -x "${APP}" ]; then
  exec "${APP}" "$@"
else
  echo "Error: TermCanvas not found." >&2
  echo "Install termcanvas-bin (binary) or termcanvas (source) from AUR." >&2
  exit 1
fi

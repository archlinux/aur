#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="/opt/codex-app-electron-port-bin"
APP_ASAR_DIR="${APP_ROOT}/app_asar"
MAIN_JS="${APP_ASAR_DIR}/.vite/build/main.js"

if [[ ! -f "${MAIN_JS}" ]]; then
  echo "Codex app entrypoint not found: ${MAIN_JS}" >&2
  echo "Package content may be incomplete or upstream layout changed." >&2
  exit 1
fi

if command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

if [[ "${CODEX_APP_AUTO_UPDATE_ON_LAUNCH:-0}" == "1" ]]; then
  if command -v codex-app-electron-port-bin-autoupdate >/dev/null 2>&1; then
    codex-app-electron-port-bin-autoupdate || true
  fi
fi

cd "${APP_ASAR_DIR}"
exec /usr/bin/electron "${MAIN_JS}"

#!/usr/bin/env bash
set -euo pipefail

# System launcher for LyricBridge (AUR package):
# - Starts backend using system Python + uvicorn (no uv / no venv under /usr)
# - Picks a free localhost port and waits for health
# - Launches Electron frontend pointed at the backend URL

APPDIR="/usr/lib/lyricbridge"
BACKEND_DIR="${APPDIR}/backend"
FRONTEND_DIR="${APPDIR}/frontend"

# Respect pre-set backend URL if provided (e.g., external service)
if [[ -n "${LYRICBRIDGE_BACKEND_URL:-}" ]]; then
  BACKEND_URL="${LYRICBRIDGE_BACKEND_URL}"
  START_BACKEND=0
else
  START_BACKEND=1
fi

pick_free_port() {
  python - "$@" <<'PY'
import socket
s = socket.socket()
s.bind(("127.0.0.1", 0))
port = s.getsockname()[1]
s.close()
print(port)
PY
}

wait_health() {
  url="$1"; retries=60; delay=0.2
  python - "$url" "$retries" "$delay" <<'PY'
import sys, time, urllib.request, urllib.error
url = sys.argv[1]
retries = int(sys.argv[2])
delay = float(sys.argv[3])
for _ in range(retries):
    try:
        with urllib.request.urlopen(url, timeout=1.5) as r:
            if r.status == 200:
                sys.exit(0)
    except Exception:
        time.sleep(delay)
sys.exit(1)
PY
}

cleanup() {
  if [[ -n "${BACKEND_PID:-}" ]] && kill -0 "${BACKEND_PID}" 2>/dev/null; then
    kill "${BACKEND_PID}" 2>/dev/null || true
    wait "${BACKEND_PID}" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

if [[ "${START_BACKEND}" -eq 1 ]]; then
  PORT="$(pick_free_port)"
  BACKEND_URL="http://127.0.0.1:${PORT}"
  export PYTHONUNBUFFERED=1
  # Respect XDG for runtime paths to avoid writing under /usr
  STATE_BASE="${XDG_STATE_HOME:-${HOME}/.local/state}"
  CACHE_BASE="${XDG_CACHE_HOME:-${HOME}/.cache}"
  export DATA_DIR="${STATE_BASE}/lyricbridge"
  export CACHE_DIR="${CACHE_BASE}/lyricbridge"
  export ARTIFACTS_DIR="${DATA_DIR}/artifacts"
  mkdir -p "${DATA_DIR}" "${CACHE_DIR}" "${ARTIFACTS_DIR}"
  cd "${BACKEND_DIR}"
  python -m uvicorn app.main:app --host 127.0.0.1 --port "${PORT}" &
  BACKEND_PID=$!
  if ! wait_health "${BACKEND_URL}/health/"; then
    echo "[lyricbridge] Backend failed to start at ${BACKEND_URL}" >&2
    exit 1
  fi
fi

export ELECTRON_OZONE_PLATFORM_HINT="auto"
export LYRICBRIDGE_BACKEND_URL="${BACKEND_URL}"

cd "${FRONTEND_DIR}"
exec electron --class=LyricBridge .

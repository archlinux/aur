#!/usr/bin/env bash

set -euo pipefail

APPDIR="${CODEXPP_OPENAI_CODEX_APP_DIR:-/usr/lib/openai-codex-desktop}"
APP_ASAR="${APPDIR}/resources/app.asar"
WEBVIEW_DIR="${APPDIR}/content/webview"
HTTP_PYTHON_BIN="${CODEXPP_OPENAI_CODEX_PYTHON:-/usr/bin/python}"
RENDERER_PORT="${CODEXPP_RENDERER_PORT:-}"
HTTP_PID=""
ELECTRON_PID=""

find_electron_bin() {
  local candidate

  if [[ -x /usr/lib/electron39/electron ]]; then
    printf '%s\n' /usr/lib/electron39/electron
    return
  fi

  for candidate in /usr/lib/electron*/electron; do
    [[ -x "${candidate}" ]] || continue
    printf '%s\n' "${candidate}"
  done | sort -V | tail -n1
}

find_free_port() {
  "${HTTP_PYTHON_BIN}" - <<'PY'
import socket

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.bind(("127.0.0.1", 0))
    print(sock.getsockname()[1])
PY
}

wait_for_port() {
  local port="$1"

  for _ in $(seq 1 50); do
    if "${HTTP_PYTHON_BIN}" - "${port}" <<'PY'
import socket
import sys

port = int(sys.argv[1])
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.settimeout(0.2)
    raise SystemExit(0 if sock.connect_ex(("127.0.0.1", port)) == 0 else 1)
PY
    then
      return 0
    fi
    sleep 0.1
  done

  return 1
}

cleanup() {
  if [[ -n "${ELECTRON_PID}" ]]; then
    wait "${ELECTRON_PID}" 2>/dev/null || true
  fi
  if [[ -n "${HTTP_PID}" ]]; then
    kill "${HTTP_PID}" 2>/dev/null || true
    wait "${HTTP_PID}" 2>/dev/null || true
  fi
}

forward_signal() {
  local sig="$1"

  if [[ -n "${ELECTRON_PID}" ]] && kill -0 "${ELECTRON_PID}" 2>/dev/null; then
    kill -"${sig}" "${ELECTRON_PID}" 2>/dev/null || true
  fi
}

trap cleanup EXIT
trap 'forward_signal HUP' HUP
trap 'forward_signal INT' INT
trap 'forward_signal TERM' TERM

if [[ ! -d "${APPDIR}" ]]; then
  echo "Codex desktop app directory not found: ${APPDIR}" >&2
  exit 1
fi

if [[ ! -f "${APP_ASAR}" ]]; then
  echo "Codex app.asar not found: ${APP_ASAR}" >&2
  exit 1
fi

if [[ ! -d "${WEBVIEW_DIR}" ]]; then
  echo "Codex webview directory not found: ${WEBVIEW_DIR}" >&2
  exit 1
fi

ELECTRON_BIN="${CODEXPP_OPENAI_CODEX_ELECTRON:-$(find_electron_bin)}"
if [[ -z "${ELECTRON_BIN}" || ! -x "${ELECTRON_BIN}" ]]; then
  echo "Electron runtime not found under /usr/lib/electron*/electron" >&2
  exit 1
fi

if [[ -z "${RENDERER_PORT}" ]]; then
  RENDERER_PORT="$(find_free_port)"
fi

export CODEX_CLI_PATH="${CODEX_CLI_PATH:-$(command -v codex || true)}"
export BUILD_FLAVOR="${BUILD_FLAVOR:-prod}"
export NODE_ENV="${NODE_ENV:-production}"
export ELECTRON_RENDERER_URL="http://127.0.0.1:${RENDERER_PORT}/"

"${HTTP_PYTHON_BIN}" -m http.server "${RENDERER_PORT}" --bind 127.0.0.1 --directory "${WEBVIEW_DIR}" >/dev/null 2>&1 &
HTTP_PID="$!"

if ! wait_for_port "${RENDERER_PORT}"; then
  echo "Failed to start local webview server on 127.0.0.1:${RENDERER_PORT}" >&2
  exit 1
fi

"${ELECTRON_BIN}" \
  --enable-sandbox \
  --ozone-platform-hint=auto \
  --class=Codex \
  "${APP_ASAR}" \
  "$@" &
ELECTRON_PID="$!"

wait "${ELECTRON_PID}"

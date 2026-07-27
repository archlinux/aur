#!/usr/bin/env bash

set -euo pipefail

APPDIR="${CODEXPP_OPENAI_CODEX_APP_DIR:-/usr/lib/openai-codex-desktop}"
UPSTREAM_LAUNCHER="${CODEXPP_OPENAI_CODEX_LAUNCHER:-/usr/lib/codex-plus-plus/upstream/codex-desktop}"
ELECTRON_CONFIG="${CODEXPP_OPENAI_CODEX_ELECTRON_CONFIG:-/etc/codex-plus-plus/electron}"
APP_ASAR="${APPDIR}/resources/app.asar"
WEBVIEW_DIR="${APPDIR}/content/webview"
PLUGIN_AUTH_UNLOCK_FILE="${CODEXPP_PLUGIN_AUTH_UNLOCK_FILE:-/usr/lib/codex-plus-plus/webview/plugin-auth-unlocked.js}"
HTTP_PYTHON_BIN="${CODEXPP_OPENAI_CODEX_PYTHON:-/usr/bin/python}"
RENDERER_PORT="${CODEXPP_RENDERER_PORT:-5175}"
PATCHED_WEBVIEW_DIR=""
RUNTIME_WEBVIEW_DIR=""
HTTP_PID=""
ELECTRON_PID=""
USER_FLAGS=()

find_electron_bin() {
  local candidate
  local configured_electron
  local upstream_electron

  configured_electron="$(resolve_configured_electron)"
  if [[ -n "${configured_electron}" ]]; then
    printf '%s\n' "${configured_electron}"
    return
  fi

  upstream_electron="$(resolve_upstream_launcher_electron)"
  if [[ -n "${upstream_electron}" ]]; then
    printf '%s\n' "${upstream_electron}"
    return
  fi

  if [[ -x "${APPDIR}/codex" ]]; then
    printf '%s\n' "${APPDIR}/codex"
    return
  fi

  for candidate in /usr/lib/electron*/electron; do
    [[ -x "${candidate}" ]] || continue
    printf '%s\n' "${candidate}"
  done | sort -V | tail -n1
}

resolve_configured_electron() {
  local configured

  [[ -f "${ELECTRON_CONFIG}" ]] || return 0

  while IFS= read -r configured || [[ -n "${configured}" ]]; do
    configured="${configured%%#*}"
    configured="${configured#"${configured%%[![:space:]]*}"}"
    configured="${configured%"${configured##*[![:space:]]}"}"
    [[ -z "${configured}" ]] && continue
    [[ -x "${configured}" ]] && printf '%s\n' "${configured}"
    break
  done <"${ELECTRON_CONFIG}"
}

resolve_upstream_launcher_electron() {
  local launcher="${UPSTREAM_LAUNCHER}"
  local appdir_value
  local resolved

  if [[ -L "${launcher}" ]]; then
    resolved="$(readlink -f "${launcher}")"
    [[ -n "${resolved}" ]] && launcher="${resolved}"
  fi

  [[ -f "${launcher}" ]] || return 0

  appdir_value="$(
    awk '
      match($0, /appdir="([^"]+)"/, m) { print m[1]; exit }
      match($0, /appdir='\''([^'\'']+)'\''/, m) { print m[1]; exit }
    ' "${launcher}"
  )"

  awk -v appdir="${appdir_value}" '
    match($0, /electron="([^"]+)"/, m) {
      value = m[1]
      gsub(/\$\{appdir\}/, appdir, value)
      gsub(/\$appdir/, appdir, value)
      print value
      exit
    }
    match($0, /electron='\''([^'\'']+)'\''/, m) {
      value = m[1]
      gsub(/\$\{appdir\}/, appdir, value)
      gsub(/\$appdir/, appdir, value)
      print value
      exit
    }
    match($0, /\/usr\/lib\/electron[0-9]+\/electron/) {
      print substr($0, RSTART, RLENGTH)
      exit
    }
  ' "${launcher}" | while IFS= read -r resolved; do
    [[ -x "${resolved}" ]] && printf '%s\n' "${resolved}"
    break
  done
}

create_patched_webview_dir() {
  local entry
  local name

  [[ -f "${PLUGIN_AUTH_UNLOCK_FILE}" ]] || {
    echo "Codex++ plugin auth unlock file not found: ${PLUGIN_AUTH_UNLOCK_FILE}" >&2
    exit 1
  }

  PATCHED_WEBVIEW_DIR="$(mktemp -d "${TMPDIR:-/tmp}/codex-plus-plus-webview.XXXXXX")"
  install -dm755 "${PATCHED_WEBVIEW_DIR}/assets"

  for entry in "${WEBVIEW_DIR}"/*; do
    name="$(basename "${entry}")"
    if [[ "${name}" == "assets" ]]; then
      continue
    fi
    ln -s "${entry}" "${PATCHED_WEBVIEW_DIR}/${name}"
  done

  for entry in "${WEBVIEW_DIR}/assets"/*; do
    name="$(basename "${entry}")"
    if [[ "${name}" == plugin-auth-*.js ]]; then
      ln -s "${PLUGIN_AUTH_UNLOCK_FILE}" "${PATCHED_WEBVIEW_DIR}/assets/${name}"
    else
      ln -s "${entry}" "${PATCHED_WEBVIEW_DIR}/assets/${name}"
    fi
  done

  RUNTIME_WEBVIEW_DIR="${PATCHED_WEBVIEW_DIR}"
}

cleanup() {
  [[ -n "${ELECTRON_PID}" ]] && wait "${ELECTRON_PID}" 2>/dev/null || true
  [[ -n "${HTTP_PID}" ]] && kill "${HTTP_PID}" 2>/dev/null || true
  [[ -n "${HTTP_PID}" ]] && wait "${HTTP_PID}" 2>/dev/null || true
  [[ -n "${PATCHED_WEBVIEW_DIR}" ]] && rm -rf "${PATCHED_WEBVIEW_DIR}"
}

forward_signal() {
  local sig="$1"

  if [[ -n "${ELECTRON_PID}" ]] && kill -0 "${ELECTRON_PID}" 2>/dev/null; then
    kill -"${sig}" "${ELECTRON_PID}" 2>/dev/null || true
    wait "${ELECTRON_PID}" 2>/dev/null || true
  fi

  exit 0
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

CONFIG_HOME="${XDG_CONFIG_HOME:-}"
if [[ -z "${CONFIG_HOME}" && -n "${HOME:-}" ]]; then
  CONFIG_HOME="${HOME}/.config"
fi

if [[ -n "${CONFIG_HOME}" && -f "${CONFIG_HOME}/codex-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    USER_FLAGS+=("${flag_parts[@]}")
  done <"${CONFIG_HOME}/codex-flags.conf"
fi

export CODEX_CLI_PATH="${CODEX_CLI_PATH:-$(command -v codex || true)}"
export BUILD_FLAVOR="${BUILD_FLAVOR:-prod}"
export NODE_ENV="${NODE_ENV:-production}"
export ELECTRON_RENDERER_URL="${CODEXPP_ELECTRON_RENDERER_URL:-http://127.0.0.1:${RENDERER_PORT}/}"

create_patched_webview_dir

READY_FILE="${PATCHED_WEBVIEW_DIR}/.ready"
FAIL_FILE="${PATCHED_WEBVIEW_DIR}/.fail"

"${HTTP_PYTHON_BIN}" - "${RENDERER_PORT}" "${RUNTIME_WEBVIEW_DIR}" "${READY_FILE}" "${FAIL_FILE}" >/dev/null 2>&1 <<'PY' &
import http.server
import os
import socketserver
import sys

port = int(sys.argv[1])
root = sys.argv[2]
ready_file = sys.argv[3]
fail_file = sys.argv[4]
os.chdir(root)

class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")
        super().end_headers()

    def log_message(self, fmt, *args):
        pass

class TCPServer(socketserver.TCPServer):
    allow_reuse_address = True

try:
    with TCPServer(("127.0.0.1", port), Handler) as httpd:
        with open(ready_file, "w") as f:
            f.write("ok")
        httpd.serve_forever()
except Exception as e:
    with open(fail_file, "w") as f:
        f.write(str(e))
    raise
PY
HTTP_PID="$!"

for _ in {1..50}; do
  [[ -f "${READY_FILE}" ]] && break
  if [[ -f "${FAIL_FILE}" ]]; then
    echo "Failed start local webview server on 127.0.0.1:${RENDERER_PORT}" >&2
    cat "${FAIL_FILE}" >&2
    exit 1
  fi
  kill -0 "${HTTP_PID}" 2>/dev/null || {
    echo "Local webview server exited before becoming ready" >&2
    exit 1
  }
  sleep 0.1
done

[[ -f "${READY_FILE}" ]] || {
  echo "Timed out waiting for local webview server on 127.0.0.1:${RENDERER_PORT}" >&2
  exit 1
}

"${ELECTRON_BIN}" \
  --enable-sandbox \
  --ozone-platform-hint=auto \
  --class=Codex \
  "${USER_FLAGS[@]}" \
  "${APP_ASAR}" \
  "$@" &
ELECTRON_PID="$!"
wait "${ELECTRON_PID}"

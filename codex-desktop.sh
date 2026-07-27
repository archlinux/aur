#!/bin/bash
# SPDX-FileCopyrightText: 2026 Arch Linux Contributors
# SPDX-License-Identifier: 0BSD
set -euo pipefail

appdir="/usr/lib/openai-codex-desktop"
electron="${appdir}/codex"
webview_dir="${appdir}/content/webview"
user_flags=()
ozone_flags=(--ozone-platform-hint=auto)
pet_pointer_recovery_default=0

# Electron cannot request global always-on-top placement through standard
# Wayland. Plasma users need XWayland for the pet overlay; other desktops keep
# Electron's native auto-selection unless the fallback is explicitly enabled.
desktop_id="${XDG_CURRENT_DESKTOP:-${DESKTOP_SESSION:-}}"
if [[ "${XDG_SESSION_TYPE:-}" == "wayland" || -n "${WAYLAND_DISPLAY:-}" ]]; then
  if [[ "${CODEX_DESKTOP_NATIVE_WAYLAND:-0}" != "1" ]]; then
    case "${desktop_id,,}" in
      *kde*|*plasma*) ozone_flags=(--ozone-platform=x11) ;;
      *)
        [[ "${CODEX_DESKTOP_FORCE_XWAYLAND:-0}" == "1" ]] &&
          ozone_flags=(--ozone-platform=x11)
        ;;
    esac
  fi
fi

[[ "${ozone_flags[0]}" == "--ozone-platform=x11" ]] &&
  pet_pointer_recovery_default=1

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

if [[ -n "${config_home}" && -f "${config_home}/codex-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/codex-flags.conf"
fi

export CODEX_CLI_PATH="${CODEX_CLI_PATH:-$(command -v codex || true)}"
export BUILD_FLAVOR="${BUILD_FLAVOR:-prod}"
export NODE_ENV="${NODE_ENV:-production}"
export CODEX_DESKTOP_QUIT_ON_LAST_WINDOW="${CODEX_DESKTOP_QUIT_ON_LAST_WINDOW:-1}"
export CODEX_DESKTOP_PET_POINTER_RECOVERY="${CODEX_DESKTOP_PET_POINTER_RECOVERY:-${pet_pointer_recovery_default}}"
export CODEX_DESKTOP_ISOLATE_NOTIFICATIONS="${CODEX_DESKTOP_ISOLATE_NOTIFICATIONS:-1}"
webview_cache_version=""
if [[ -f "${appdir}/resources/app.asar" ]]; then
  webview_cache_version="$(stat -c '%Y-%s' "${appdir}/resources/app.asar" 2>/dev/null || true)"
fi

if [[ -n "${config_home}" && -n "${webview_cache_version}" ]]; then
  state_dir="${config_home}/Codex"
  version_file="${state_dir}/aur-webview-cache-version"
  previous_version=""
  [[ -f "${version_file}" ]] && previous_version="$(<"${version_file}")"

  if [[ "${previous_version}" != "${webview_cache_version}" ]]; then
    rm -rf "${state_dir}/Cache" "${state_dir}/Code Cache"
    mkdir -p "${state_dir}"
    printf '%s\n' "${webview_cache_version}" >"${version_file}"
  fi
fi

renderer_query=""
[[ -n "${webview_cache_version}" ]] &&
  renderer_query="?aurWebviewVersion=${webview_cache_version}"

http_pid=""
electron_pid=""
tmpdir=""
kwin_script_loaded=0
kwin_script_name="codex-pet-keep-above-v1"

cleanup() {
  local exit_status=$?

  trap - EXIT HUP INT TERM
  [[ -n "${http_pid}" ]] && kill "${http_pid}" 2>/dev/null || true
  [[ -n "${http_pid}" ]] && wait "${http_pid}" 2>/dev/null || true
  if [[ -n "${electron_pid}" ]] && kill -0 "${electron_pid}" 2>/dev/null; then
    kill -TERM "${electron_pid}" 2>/dev/null || true
  fi
  [[ -n "${electron_pid}" ]] && wait "${electron_pid}" 2>/dev/null || true
  if [[ "${kwin_script_loaded}" == "1" ]]; then
    /usr/bin/qdbus6 org.kde.KWin /Scripting \
      org.kde.kwin.Scripting.unloadScript "${kwin_script_name}" \
      >/dev/null 2>&1 || true
  fi
  [[ -n "${tmpdir}" ]] && rm -rf "${tmpdir}"

  return "${exit_status}"
}

forward_signal() {
  local sig="$1"

  if [[ -n "${electron_pid}" ]] && kill -0 "${electron_pid}" 2>/dev/null; then
    kill -"${sig}" "${electron_pid}" 2>/dev/null || true
  fi

  exit 0
}

trap cleanup EXIT
trap 'forward_signal HUP' HUP
trap 'forward_signal INT' INT
trap 'forward_signal TERM' TERM

start_kwin_pet_keep_above() {
  local script_path="${appdir}/kwin-codex-pet-keep-above.js"
  local script_id

  [[ "${CODEX_DESKTOP_PET_POINTER_RECOVERY}" == "1" ]] || return 0
  [[ "${desktop_id,,}" == *kde* || "${desktop_id,,}" == *plasma* ]] || return 0
  [[ -x /usr/bin/qdbus6 ]] || return 0
  [[ -f "${script_path}" ]] || return 0

  script_id="$(
    /usr/bin/qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript \
      "${script_path}" "${kwin_script_name}" 2>/dev/null || true
  )"
  [[ "${script_id}" =~ ^[0-9]+$ ]] || return 0

  if /usr/bin/qdbus6 org.kde.KWin "/Scripting/Script${script_id}" \
    org.kde.kwin.Script.run >/dev/null 2>&1; then
    kwin_script_loaded=1
    return 0
  fi

  /usr/bin/qdbus6 org.kde.KWin /Scripting \
    org.kde.kwin.Scripting.unloadScript "${kwin_script_name}" \
    >/dev/null 2>&1 || true
}

if [[ -z "${ELECTRON_RENDERER_URL:-}" && -d "${webview_dir}" ]] &&
  find "${webview_dir}" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
  tmpdir="$(mktemp -d)"
  ready_file="${tmpdir}/ready"
  fail_file="${tmpdir}/fail"

  python - "${webview_dir}" "${ready_file}" "${fail_file}" >/dev/null 2>&1 <<'PY' &
import http.server
import os
import socketserver
import sys
import threading
import time

root = sys.argv[1]
ready_file = sys.argv[2]
fail_file = sys.argv[3]

parent_pid = os.getppid()

def exit_with_parent():
    while os.getppid() == parent_pid:
        time.sleep(0.25)
    os._exit(0)

threading.Thread(target=exit_with_parent, daemon=True).start()

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
    with TCPServer(("127.0.0.1", 0), Handler) as httpd:
        with open(ready_file, "w") as f:
            f.write(str(httpd.server_address[1]))
        httpd.serve_forever()
except Exception as e:
    with open(fail_file, "w") as f:
        f.write(str(e))
    raise
PY
  http_pid=$!

  for _ in {1..50}; do
    [[ -f "${ready_file}" ]] && break
    if [[ -f "${fail_file}" ]]; then
      echo "Failed to start local webview server" >&2
      cat "${fail_file}" >&2
      exit 1
    fi
    kill -0 "${http_pid}" 2>/dev/null || {
      echo "Local webview server exited before becoming ready" >&2
      exit 1
    }
    sleep 0.1
  done

  [[ -f "${ready_file}" ]] || {
    echo "Timed out waiting for local webview server" >&2
    exit 1
  }

  bridge_port="$(<"${ready_file}")"
  [[ "${bridge_port}" =~ ^[0-9]+$ ]] || {
    echo "Local webview server returned an invalid port: ${bridge_port}" >&2
    exit 1
  }
  export ELECTRON_RENDERER_URL="http://127.0.0.1:${bridge_port}/${renderer_query}"
fi

start_kwin_pet_keep_above

"${electron}" \
  --enable-sandbox \
  "${ozone_flags[@]}" \
  --class=codex \
  "${user_flags[@]}" \
  "${appdir}/resources/app.asar" \
  "$@" &
electron_pid=$!
wait "${electron_pid}"

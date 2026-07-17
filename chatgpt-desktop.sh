#!/bin/bash
# SPDX-FileCopyrightText: 2026 Arch Linux Contributors
# SPDX-License-Identifier: 0BSD
set -euo pipefail

appdir="/usr/lib/chatgpt-desktop-bin"
electron="${appdir}/chatgpt"
webview_dir="${appdir}/content/webview"
user_flags=()

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

if [[ -n "${config_home}" && -f "${config_home}/chatgpt-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/chatgpt-flags.conf"
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

http_pid=""
electron_pid=""
tmpdir=""

cleanup() {
  local status=$?

  trap - EXIT HUP INT TERM
  [[ -n "${http_pid}" ]] && kill "${http_pid}" 2>/dev/null || true
  [[ -n "${electron_pid}" ]] && kill "${electron_pid}" 2>/dev/null || true
  [[ -n "${http_pid}" ]] && wait "${http_pid}" 2>/dev/null || true
  [[ -n "${electron_pid}" ]] && wait "${electron_pid}" 2>/dev/null || true
  [[ -n "${tmpdir}" ]] && rm -rf "${tmpdir}"

  return "${status}"
}

forward_signal() {
  local sig="$1"

  if [[ -n "${electron_pid}" ]] && kill -0 "${electron_pid}" 2>/dev/null; then
    kill -"${sig}" "${electron_pid}" 2>/dev/null || true
  fi
  if [[ -n "${http_pid}" ]] && kill -0 "${http_pid}" 2>/dev/null; then
    kill -"${sig}" "${http_pid}" 2>/dev/null || true
  fi

  exit 0
}

trap cleanup EXIT
trap 'forward_signal HUP' HUP
trap 'forward_signal INT' INT
trap 'forward_signal TERM' TERM

if [[ -d "${webview_dir}" ]] && find "${webview_dir}" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
  tmpdir="$(mktemp -d)"
  ready_file="${tmpdir}/ready"
  fail_file="${tmpdir}/fail"
  electron_pid_file="${tmpdir}/electron.pid"

  python - "${webview_dir}" "${ready_file}" "${fail_file}" "$$" "${electron_pid_file}" >/dev/null 2>&1 <<'PY' &
import ctypes
import http.server
import os
import signal
import socketserver
import sys
import threading
import time

root = sys.argv[1]
ready_file = sys.argv[2]
fail_file = sys.argv[3]
launcher_pid = int(sys.argv[4])
electron_pid_file = sys.argv[5]

os.chdir(root)

def terminate_self():
    os.kill(os.getpid(), signal.SIGTERM)

def bind_to_launcher():
    libc = ctypes.CDLL(None, use_errno=True)
    if libc.prctl(1, signal.SIGTERM, 0, 0, 0) != 0:
        errno = ctypes.get_errno()
        raise OSError(errno, os.strerror(errno))
    if os.getppid() != launcher_pid:
        raise RuntimeError("launcher exited before webview bridge initialization")

def monitor_lifecycle():
    electron_pid = None
    while True:
        if os.getppid() != launcher_pid:
            terminate_self()
            return

        if electron_pid is None:
            try:
                with open(electron_pid_file) as f:
                    electron_pid = int(f.read().strip())
            except (FileNotFoundError, ValueError):
                time.sleep(0.1)
                continue

        try:
            os.kill(electron_pid, 0)
        except ProcessLookupError:
            terminate_self()
            return
        except PermissionError:
            pass

        time.sleep(0.25)

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, fmt, *args):
        pass

    def end_headers(self):
        self.send_header("Cache-Control", "no-store, no-cache, must-revalidate")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")
        super().end_headers()

class TCPServer(socketserver.TCPServer):
    allow_reuse_address = True

try:
    bind_to_launcher()
    with TCPServer(("127.0.0.1", 0), Handler) as httpd:
        threading.Thread(target=monitor_lifecycle, daemon=True).start()
        ready_tmp = f"{ready_file}.tmp"
        with open(ready_tmp, "w") as f:
            f.write(f"{httpd.server_address[1]}\n")
        os.replace(ready_tmp, ready_file)
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

  read -r webview_port <"${ready_file}"
  if [[ ! "${webview_port}" =~ ^[0-9]+$ ]] ||
    ((webview_port < 1 || webview_port > 65535)); then
    echo "Local webview server returned an invalid port: ${webview_port}" >&2
    exit 1
  fi

  export ELECTRON_RENDERER_URL="${ELECTRON_RENDERER_URL:-http://127.0.0.1:${webview_port}/}"
fi

"${electron}" \
  --enable-sandbox \
  --class=ChatGPT \
  "${user_flags[@]}" \
  "${appdir}/resources/app.asar" \
  "$@" &
electron_pid=$!
if [[ -n "${electron_pid_file:-}" ]]; then
  printf '%s\n' "${electron_pid}" >"${electron_pid_file}"
fi
wait "${electron_pid}"

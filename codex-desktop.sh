#!/bin/bash
# SPDX-FileCopyrightText: 2026 Arch Linux Contributors
# SPDX-License-Identifier: 0BSD
set -euo pipefail

appdir="/usr/lib/openai-codex-desktop"
electron="/usr/lib/electron39/electron"
webview_dir="${appdir}/content/webview"

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

export CODEX_CLI_PATH="${CODEX_CLI_PATH:-$(command -v codex || true)}"

http_pid=""
tmpdir=""

cleanup() {
  [[ -n "${http_pid}" ]] && kill "${http_pid}" 2>/dev/null || true
  [[ -n "${http_pid}" ]] && wait "${http_pid}" 2>/dev/null || true
  [[ -n "${tmpdir}" ]] && rm -rf "${tmpdir}"
}
trap cleanup EXIT INT TERM

if [[ -d "${webview_dir}" ]] && find "${webview_dir}" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
  tmpdir="$(mktemp -d)"
  ready_file="${tmpdir}/ready"
  fail_file="${tmpdir}/fail"

  python - 5175 "${webview_dir}" "${ready_file}" "${fail_file}" >/dev/null 2>&1 <<'PY' &
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
  http_pid=$!

  for _ in {1..50}; do
    [[ -f "${ready_file}" ]] && break
    if [[ -f "${fail_file}" ]]; then
      echo "Failed to start local webview server on 127.0.0.1:5175" >&2
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
    echo "Timed out waiting for local webview server on 127.0.0.1:5175" >&2
    exit 1
  }
fi

"${electron}" \
  --enable-sandbox \
  --ozone-platform-hint=auto \
  "${appdir}/resources/app.asar" \
  "$@"

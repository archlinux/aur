#!/usr/bin/env bash
set -euo pipefail

REAL_BIN="/usr/lib/muse/muse"

# Handle session/mcp management extensions
if [[ "${1:-}" == "session" || "${1:-}" == "sessions" ]]; then
  shift
  SESSION_HELPER="/usr/lib/muse/muse-session"
  if [[ ! -x "${SESSION_HELPER}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -x "${SCRIPT_DIR}/../lib/muse/muse-session" ]]; then
      SESSION_HELPER="${SCRIPT_DIR}/../lib/muse/muse-session"
    elif [[ -x "${SCRIPT_DIR}/muse-session" ]]; then
      SESSION_HELPER="${SCRIPT_DIR}/muse-session"
    fi
  fi
  exec "${SESSION_HELPER}" "$@"
fi

if [[ "${1:-}" == "mcp" ]]; then
  shift
  MCP_HELPER="/usr/lib/muse/muse-mcp"
  if [[ ! -x "${MCP_HELPER}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -x "${SCRIPT_DIR}/../lib/muse/muse-mcp" ]]; then
      MCP_HELPER="${SCRIPT_DIR}/../lib/muse/muse-mcp"
    elif [[ -x "${SCRIPT_DIR}/muse-mcp" ]]; then
      MCP_HELPER="${SCRIPT_DIR}/muse-mcp"
    fi
  fi
  exec "${MCP_HELPER}" "$@"
fi

if [[ "$(uname -m)" == "x86_64" ]] && ! grep -q -m1 "avx2" /proc/cpuinfo 2>/dev/null; then
  if command -v qemu-x86_64 >/dev/null 2>&1; then
    exec qemu-x86_64 -cpu max "$REAL_BIN" "$@"
  else
    printf 'Error: Your CPU does not support AVX2 instructions required by Muse.\n' >&2
    printf 'Please install qemu-user (sudo pacman -S qemu-user) to run Muse on legacy CPUs.\n' >&2
    exit 1
  fi
else
  exec "$REAL_BIN" "$@"
fi

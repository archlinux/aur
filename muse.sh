#!/usr/bin/env bash
set -euo pipefail

REAL_BIN="/usr/lib/muse/muse"
export TBH_SESSION_MESSAGE_SOCKET="${TBH_SESSION_MESSAGE_SOCKET:-/tmp/muse-${USER:-$(id -un)}.sock}"

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

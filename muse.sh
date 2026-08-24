#!/usr/bin/env bash
set -euo pipefail

REAL_BIN="/usr/lib/muse/muse"

if [[ "$(uname -m)" == "x86_64" ]] && ! grep -q -m1 "avx2" /proc/cpuinfo 2>/dev/null; then
  if command -v intel-sde >/dev/null 2>&1; then
    exec intel-sde -hsw -no-follow-child -- "$REAL_BIN" "$@"
  elif command -v sde64 >/dev/null 2>&1; then
    exec sde64 -hsw -no-follow-child -- "$REAL_BIN" "$@"
  elif command -v sde >/dev/null 2>&1; then
    exec sde -hsw -no-follow-child -- "$REAL_BIN" "$@"
  else
    printf 'Error: Your CPU does not support AVX2 instructions required by Muse.\n' >&2
    printf 'Please install Intel SDE (e.g., yay -S intel-sde) to run Muse on legacy CPUs.\n' >&2
    exit 1
  fi
else
  exec "$REAL_BIN" "$@"
fi

#!/usr/bin/env bash
set -euo pipefail

ROOT="/usr/lib/lhdc-v5-helper"
LIBLHDC="${LHDCV5_LIB:-$ROOT/lib/liblhdcv5.so}"

if [[ ! -f "$LIBLHDC" ]]; then
  echo "missing LHDC v5 encoder library: $LIBLHDC" >&2
  echo "copy liblhdcv5.so to $ROOT/lib/liblhdcv5.so or set LHDCV5_LIB" >&2
  exit 66
fi

export LD_LIBRARY_PATH="$ROOT/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec qemu-aarch64 -L /usr/aarch64-linux-gnu \
  "$ROOT/bin/lhdc-helper-stdio" "$LIBLHDC"

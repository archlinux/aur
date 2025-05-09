#!/bin/bash

set -euo pipefail

KERNEL_HEADERS_DIR="/usr/lib/modules/$(uname -r)/build/include"
TARGET_DIR="/usr/include"

DIRS=("acpi" "asm-generic" "clocksource" "crypto" "cxl" "drm" "dt-bindings" "generated" "hyperv" "keys" "kunit" "kvm" "linux" "math-emu" "media" "memory" "misc" "net" "pcmcia" "ras" "rdma" "rv" "scsi" "soc" "sound" "target" "trace" "uapi" "ufs" "vdso" "video" "xen")

log() {
  echo -e "[\033[1;32mINFO\033[0m] $1"
}

warn() {
  echo -e "[\033[1;33mWARN\033[0m] $1" >&2
}

error() {
  echo -e "[\033[1;31mERROR\033[0m] $1" >&2
}

log "Removing existing header directories from $TARGET_DIR..."
for dir in "${DIRS[@]}"; do
  if [ -d "$TARGET_DIR/$dir" ]; then
    rm -rf "$TARGET_DIR/$dir" && log "Deleted $dir"
  else
    warn "$dir not found, skipping"
  fi
done

log "Copying headers from $KERNEL_HEADERS_DIR to $TARGET_DIR..."
for dir in "${DIRS[@]}"; do
  SRC="$KERNEL_HEADERS_DIR/$dir"
  DEST="$TARGET_DIR/$dir"
  if [ -d "$SRC" ]; then
    cp -r "$SRC" "$DEST" && log "Copied $dir"
  else
    warn "$dir missing in source, skipped"
  fi
done

log "✅ Kernel headers successfully copied to $TARGET_DIR."

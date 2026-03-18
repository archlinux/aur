#!/bin/bash
set -euo pipefail
shopt -s nullglob

ESP="/boot/efi"
BOOT="/boot"

for img in "$BOOT"/booster-*.img; do
    kver=$(booster cat "$img" etc/booster.init.yaml | grep '^kernel:' | awk '{print $2}')

    if [[ -n "$kver" ]]; then
        echo "Removing systemd-boot entry for kernel $kver from $img..."
        kernel-install remove "$kver" || true
    fi
done

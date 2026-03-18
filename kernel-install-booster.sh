#!/bin/bash
set -euo pipefail
shopt -s nullglob

cd /

for kernel_dir in /usr/lib/modules/*; do
    [[ -d "$kernel_dir" ]] || continue

    if ! pkgbase=$(pacman -Qqo "$kernel_dir/pkgbase" 2>/dev/null); then
        echo "Skipping $kernel_dir, no package found"
        continue
    fi

    kver=$(basename $kernel_dir)

    vmlinuz="/boot/vmlinuz-$pkgbase"
    initramfs="/boot/booster-$pkgbase.img"

    if [[ -f "$vmlinuz" && -f "$initramfs" ]]; then
        echo "Registering $kver ($vmlinuz + $initramfs) in systemd-boot..."
        kernel-install add "$kver" "$vmlinuz" "$initramfs"
    else
        echo "Warning: missing vmlinuz or initramfs for $pkgbase"
    fi
done

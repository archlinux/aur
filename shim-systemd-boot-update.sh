#!/bin/bash

ESP_DIR="$(bootctl -p)"
BOOT_LOADER_EFI="$ESP_DIR/EFI/systemd/systemd-bootx64.efi"
SHIM_TARGET_EFI="$ESP_DIR/EFI/BOOT/grubx64.efi"

if diff -q "$BOOT_LOADER_EFI" "$SHIM_TARGET_EFI"; then
    echo "info: no changes, nothing to do"
    exit 0
fi

if cp "$BOOT_LOADER_EFI" "$SHIM_TARGET_EFI"; then
    echo "info: bootloader installed as EFI shim target"
    exit 0
fi

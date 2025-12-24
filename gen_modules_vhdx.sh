#!/bin/bash
set -euo pipefail

modules_dir="$1"        # e.g. "$srcdir/modules"
kernelver="$2"          # e.g. "6.7.4-arch1-1"
output="$3"             # e.g. "$pkgdir/modules.vhdx"

modules_src="$modules_dir/lib/modules/$kernelver"

if [[ ! -d "$modules_src" ]]; then
    echo "Missing modules directory: $modules_src" >&2
    exit 1
fi

if [[ -e "$output" ]]; then
    echo "Refusing to overwrite existing file $output" >&2
    exit 2
fi

# Calculate modules size (+256 MiB slack)
modules_size=$(du -bs "$modules_src" | awk '{print $1}')
modules_size=$((modules_size + 256 * 1024 * 1024))

# ext4 block size (4 KiB)
block_size=4096
blocks=$(( (modules_size + block_size - 1) / block_size ))

# Temporary workspace (makepkg-safe)
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

img="$tmp_dir/modules.img"

# Create ext4 image populated from directory (NO MOUNTING)
mke2fs \
    -t ext4 \
    -b $block_size \
    -d "$modules_src" \
    "$img" \
    "$blocks"

# Convert to VHDX
qemu-img convert -O vhdx "$img" "$output"

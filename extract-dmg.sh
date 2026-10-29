#!/bin/bash
# Extract the font files out of an Apple font .dmg without hardcoding the
# internal layout (dmg -> apfs/hfs image -> .pkg (xar) -> Payload (cpio)).
#
# Usage: extract-dmg.sh FILE.dmg OUTDIR
set -euo pipefail

dmg=$1
out=$2
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

mkdir -p "$out" "$work/dmg" "$work/fs" "$work/pkg"

# 1. dmg -> disk image(s) (and sometimes files directly)
7z x -y -bso0 -bsp0 -o"$work/dmg" "$dmg"

# 2. disk image -> files
while IFS= read -r -d '' img; do
  7z x -y -bso0 -bsp0 -o"$work/fs" "$img"
done < <(find "$work/dmg" -type f \
  \( -iname '*.apfs' -o -iname '*.hfs' -o -iname '*.hfsx' -o -iname '*.img' \) -print0)

# 3. .pkg (xar) -> Payload files
n=0
while IFS= read -r -d '' pkg; do
  n=$((n + 1))
  dest="$work/pkg/$n"
  mkdir -p "$dest"
  bsdtar -xf "$pkg" -C "$dest" 2>/dev/null || 7z x -y -bso0 -bsp0 -o"$dest" "$pkg"
done < <(find "$work/dmg" "$work/fs" -type f -iname '*.pkg' -print0)

# 4. Payload (compressed cpio) -> installed file tree
found=0
while IFS= read -r -d '' payload; do
  found=1
  if ! bsdtar -xf "$payload" -C "$out" 2>/dev/null; then
    # Fallback: let 7z unwrap the compression, then read the inner cpio
    tmp=$(mktemp -d -p "$work")
    7z x -y -bso0 -bsp0 -o"$tmp" "$payload"
    inner=$(find "$tmp" -type f | head -n1)
    bsdtar -xf "$inner" -C "$out"
  fi
done < <(find "$work/pkg" -type f -name 'Payload' -print0)

if (( ! found )); then
  # Some dmgs carry the fonts directly instead of inside a pkg
  find "$work/dmg" "$work/fs" -type f \
    \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' \) -exec cp -t "$out" {} +
fi

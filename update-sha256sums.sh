#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./update-sha256sums.sh [PKGBUILD-path]
# If no path is provided, defaults to PKGBUILD next to this script.

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd -P)
PKGFILE="${1:-"$script_dir/PKGBUILD"}"

if [[ ! -f "$PKGFILE" ]]; then
  echo "PKGBUILD not found: $PKGFILE" >&2
  exit 1
fi

# Extract pkgver (expects a line like: pkgver=0.x.y)
pkgver=$(grep -E '^[[:space:]]*pkgver=' "$PKGFILE" | head -n1 | cut -d '=' -f2)
if [[ -z "${pkgver:-}" ]]; then
  echo "Failed to read pkgver from $PKGFILE" >&2
  exit 1
fi

tag="v${pkgver}"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

binary_url="https://github.com/Firstp1ck/Pacsea/releases/download/${tag}/Pacsea"
src_url="https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${tag}.tar.gz"

echo "Downloading artifacts for ${tag}..." >&2
curl -fsSL -o "$tmpdir/Pacsea" "$binary_url"
curl -fsSL -o "$tmpdir/Pacsea-${tag}.tar.gz" "$src_url"

sha_bin=$(sha256sum "$tmpdir/Pacsea" | awk '{print $1}')
sha_src=$(sha256sum "$tmpdir/Pacsea-${tag}.tar.gz" | awk '{print $1}')

# Locate the sha256sums=( line number.
sha_line=$(grep -n "^sha256sums=(" "$PKGFILE" | head -n1 | cut -d: -f1)
if [[ -z "${sha_line:-}" ]]; then
  echo "Could not find sha256sums=( in $PKGFILE" >&2
  exit 1
fi

# Replace quoted content on the sha256sums header line (first entry) and the next line (second entry).
sed -i "${sha_line}s/'[^']*'/'${sha_bin//\//\/}'/" "$PKGFILE"
sed -i "$((sha_line+1))s/'[^']*'/'${sha_src//\//\/}'/" "$PKGFILE"

echo "Updated sha256sums in $PKGFILE:" >&2
echo "  binary:  $sha_bin" >&2
echo "  source:  $sha_src" >&2



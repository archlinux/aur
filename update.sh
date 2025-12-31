#!/usr/bin/env bash
set -euo pipefail

PKGDIR="${1:-.}"
PKGBUILD="$PKGDIR/PKGBUILD"
SRCINFO="$PKGDIR/.SRCINFO"
TMPDIR="$(mktemp -d)"

cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

if [ ! -f "$PKGBUILD" ]; then
  echo "PKGBUILD not found in $PKGDIR" >&2
  exit 1
fi

pushd "$PKGDIR" >/dev/null

# Generate checksums and update PKGBUILD
arrays="$(makepkg -g 2>/dev/null || true)"
if [ -z "$arrays" ]; then
  echo "makepkg -g produced no checksums; PKGBUILD unchanged" >&2
else
  while IFS= read -r line; do
    var="${line%%=*}"
    if [[ "$var" =~ ^sha256sums ]]; then
      sed -i "s|^${var}=.*$|$line|" "$PKGBUILD"
    fi
  done <<< "$arrays"
fi

# Update .SRCINFO
makepkg --printsrcinfo > "$SRCINFO"

popd >/dev/null
echo "Updated $PKGBUILD and $SRCINFO"

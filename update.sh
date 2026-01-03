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
  # Create a temp file with the new arrays
  cp "$PKGBUILD" "$TMPDIR/PKGBUILD.orig"
  
  # Remove all existing sha256sums lines (including multi-line arrays)
  sed -i '/^sha256sums.*=/,/)/{ /^sha256sums.*=/!{/)/!d}; /^sha256sums.*=/{N; :a; /)/!{N; ba}; d} }' "$PKGBUILD"
  
  # Find the line number where to insert (after last source line)
  insert_line=$(grep -n '^source.*=' "$PKGBUILD" | tail -1 | cut -d: -f1)
  if [ -z "$insert_line" ]; then
    insert_line=$(wc -l < "$PKGBUILD")
  else
    # Find the end of the source array
    insert_line=$(awk -v start=$insert_line 'NR>=start && /)/ {print NR; exit}' "$PKGBUILD")
  fi
  
  # Insert new checksums after the source arrays
  {
    head -n "$insert_line" "$PKGBUILD"
    echo ""
    echo "$arrays"
    tail -n "+$((insert_line + 1))" "$PKGBUILD"
  } > "$TMPDIR/PKGBUILD.new"
  
  mv "$TMPDIR/PKGBUILD.new" "$PKGBUILD"
fi

# Update .SRCINFO
makepkg --printsrcinfo > "$SRCINFO"

popd >/dev/null
echo "Updated $PKGBUILD and $SRCINFO"

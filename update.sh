#!/usr/bin/env bash
set -euo pipefail

MANIFEST_URL="https://download.qoder.com/qodercli/channels/manifest.json"
LICENSE_URL="https://qoder.com/product-service"

PKGBUILD="PKGBUILD"
LICENSE_FILE="LICENSE"

require() { command -v "$1" >/dev/null 2>&1 || { echo "Missing '$1'" >&2; exit 1; }; }

require curl
require jq
require sed
require sha256sum
require makepkg
require cmp

[[ -f "$PKGBUILD" ]] || { echo "Run from package root" >&2; exit 1; }

# --- current values ---
cur_ver="$(sed -nE 's/^pkgver=([0-9.]+).*/\1/p' "$PKGBUILD" | head -n1)"
cur_rel="$(sed -nE 's/^pkgrel=([0-9]+).*/\1/p' "$PKGBUILD" | head -n1)"

# --- fetch manifest ---
manifest="$(curl -fsSL "$MANIFEST_URL")"
latest="$(jq -r '.latest' <<<"$manifest")"
sha_amd64="$(jq -r '.files[] | select(.os=="linux" and .arch=="amd64") | .sha256' <<<"$manifest")"
sha_arm64="$(jq -r '.files[] | select(.os=="linux" and .arch=="arm64") | .sha256' <<<"$manifest")"

ver_changed=0
[[ "$latest" != "$cur_ver" ]] && ver_changed=1

# --- check license change ---
tmp_license="$(mktemp)"
trap 'rm -f "$tmp_license"' EXIT
curl -fsSL "$LICENSE_URL" -o "$tmp_license"

license_changed=0
if [[ -f "$LICENSE_FILE" ]]; then
  old_sha="$(sha256sum "$LICENSE_FILE" | awk '{print $1}')"
  new_sha="$(sha256sum "$tmp_license" | awk '{print $1}')"
  [[ "$old_sha" != "$new_sha" ]] && license_changed=1
else
  license_changed=1
fi

# --- early exit ---
if [[ "$ver_changed" -eq 0 && "$license_changed" -eq 0 ]]; then
  echo "No updates detected."
  exit 0
fi

echo "Updating..."

# --- update version ---
if [[ "$ver_changed" -eq 1 ]]; then
  sed -i -E "s/^pkgver=.*/pkgver=$latest/" "$PKGBUILD"
  sed -i -E "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD"
  sed -i -E "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('$sha_amd64')/" "$PKGBUILD"
  sed -i -E "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('$sha_arm64')/" "$PKGBUILD"
fi

# --- update license ---
if [[ "$license_changed" -eq 1 ]]; then
  mv "$tmp_license" "$LICENSE_FILE"
  # Only update the first sha256sum (LICENSE), preserve the rest
  sed -i "s/^sha256sums=('\\?[a-f0-9]*'\\?/sha256sums=('$new_sha'/" "$PKGBUILD"
  if [[ "$ver_changed" -eq 0 ]]; then
    new_rel=$((cur_rel + 1))
    sed -i -E "s/^pkgrel=.*/pkgrel=$new_rel/" "$PKGBUILD"
  fi
fi

makepkg --printsrcinfo > .SRCINFO

echo "Update finished. Review with: git diff"

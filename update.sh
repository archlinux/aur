#!/usr/bin/env bash
set -euo pipefail

repo="termermc/FriendNet"
api="https://api.github.com/repos/${repo}/releases/latest"

json="$(curl -fsSL "$api")"

tag="$(jq -r '.tag_name' <<<"$json")"          # e.g. v1.1.1
ver="${tag#v}"                                # e.g. 1.1.1

# Asset info (avoid hardcoding the URL pattern)
asset_name="friendnet-client-linux_amd64.deb"
asset_url="$(jq -r --arg n "$asset_name" \
  '.assets[] | select(.name==$n) | .browser_download_url' <<<"$json")"

if [[ -z "$asset_url" || "$asset_url" == "null" ]]; then
  echo "Could not find asset '$asset_name' in latest release" >&2
  exit 1
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

curl -fsSL -o "$tmpdir/$asset_name" "$asset_url"
sha="$(sha256sum "$tmpdir/$asset_name" | awk '{print $1}')"

# Update PKGBUILD
# 1) pkgver
sed -i -E "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD

# 2) source URL: releases/download/<TAG>/...  (TAG includes the leading v)
#    Keep your local filename prefix using $pkgver as you already do.
sed -i -E \
  "s|(releases/download/)[^/]+/friendnet-client-linux_amd64\.deb|\\1${tag}/friendnet-client-linux_amd64.deb|" \
  PKGBUILD

# 3) sha256sums (single-entry array)
sed -i -E \
  "s/^sha256sums=\(.*/sha256sums=('${sha}')/" \
  PKGBUILD

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

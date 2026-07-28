#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

git clone --bare --depth=1 https://codeberg.org/lewisflames/spendo.git "$tmpdir/repo" >/dev/null 2>&1

pkgver_new=$(git -C "$tmpdir/repo" describe --long --tags --always | sed 's/^v//; s/-/./g')

sed -i "s/^pkgver=.*/pkgver=$pkgver_new/" PKGBUILD
sed -i "s/^	pkgver = .*/	pkgver = $pkgver_new/" .SRCINFO

echo "Updated pkgver to $pkgver_new"

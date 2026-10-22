#!/usr/bin/env bash
# 更新 AUR 包的 pkgver 与 .SRCINFO。
#
# 用法：./update-srcinfo.sh [ref]      # ref 默认 main，可传分支名用于预演
# 规则与 PKGBUILD 的 pkgver() 一致：<tag>.r<commit-count>.g<short-hash>
set -euo pipefail

ref="${1:-main}"
url="https://github.com/Sheyiyuan/zero-beat.git"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

git clone --quiet --filter=blob:none "$url" "$tmp/src"
(
  cd "$tmp/src"
  git fetch --quiet --tags origin "$ref"
  git checkout --quiet FETCH_HEAD
  tag="$(git describe --tags --abbrev=0 2>/dev/null || echo v0.0.0)"
  count="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${tag#v}" "$count" "$hash" > "$tmp/pkgver"
)
ver="$(cat "$tmp/pkgver")"

sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD
sed -i "0,/^\tpkgver = .*/s//\tpkgver = ${ver}/" .SRCINFO

echo "pkgver -> ${ver}"
echo "别忘了：git add PKGBUILD .SRCINFO && git commit -m \"upgpkg: $(awk -F= '/^pkgname=/{print $2}' PKGBUILD) ${ver}-$(awk -F= '/^pkgrel=/{print $2}' PKGBUILD)\" && git push"

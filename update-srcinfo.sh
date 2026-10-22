#!/usr/bin/env bash
# 更新 AUR 包的 pkgver 与 .SRCINFO。
#
# 用法：./update-srcinfo.sh [ref] [repo-path]
#   ref        分支/提交，默认 main
#   repo-path  本地 zero-beat 仓库路径；省略时从 GitHub 拉临时克隆
# 规则与 PKGBUILD 的 pkgver() 一致：<tag>.r<commit-count>.g<short-hash>
set -euo pipefail

ref="${1:-main}"
src="${2:-}"
tmp=""
cleanup() { [ -n "$tmp" ] && rm -rf "$tmp"; }
trap cleanup EXIT

if [ -z "$src" ]; then
  tmp="$(mktemp -d)"
  src="$tmp/src"
  git clone --quiet --filter=blob:none "${ZERO_BEAT_REPO:-git@github.com:Sheyiyuan/zero-beat.git}" "$src"
  git -C "$src" fetch --quiet --tags origin "$ref"
  git -C "$src" checkout --quiet FETCH_HEAD
else
  git -C "$src" rev-parse --verify --quiet "$ref" >/dev/null || { echo "本地仓库没有 ref：$ref" >&2; exit 1; }
fi

tag="$(git -C "$src" describe --tags --abbrev=0 "$ref" 2>/dev/null || echo v0.0.0)"
count="$(git -C "$src" rev-list --count "$ref")"
hash="$(git -C "$src" rev-parse --short "$ref")"
ver="${tag#v}.r${count}.g${hash}"

sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD
sed -i "0,/^\tpkgver = .*/s//\tpkgver = ${ver}/" .SRCINFO

echo "pkgver -> ${ver}"
echo "下一步：git add PKGBUILD .SRCINFO && git commit -m \"upgpkg: zero-beat-git ${ver}-1\" && git push"

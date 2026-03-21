#!/usr/bin/env bash
set -euo pipefail

repo_owner='Rsplwe'
repo_name='bili-live-hime'
pkgbuild='PKGBUILD'
api_url="https://api.github.com/repos/${repo_owner}/${repo_name}/releases/latest"

cd "$(dirname "$0")"

latest_tag="$(curl -fsSL "$api_url" | jq -r '.tag_name')"
if [[ -z "$latest_tag" || "$latest_tag" == "null" ]]; then
    echo "无法获取最新 release tag"
    exit 1
fi

latest_ver="${latest_tag#LiveHime-v}"
if [[ "$latest_ver" == "$latest_tag" ]]; then
    echo "上游 tag 格式不是 LiveHime-vX.Y.Z: $latest_tag"
    exit 1
fi

current_ver="$(sed -n 's/^pkgver=//p' "$pkgbuild" | head -n 1)"

  if [[ "$latest_ver" == "$current_ver" ]]; then
    echo "当前已是最新版本: $current_ver"
    exit 0
fi

tmp_file="$(mktemp)"
sed \
    -e "s/^pkgver=.*/pkgver=${latest_ver}/" \
    -e 's/^pkgrel=.*/pkgrel=1/' \
    "$pkgbuild" > "$tmp_file"
mv "$tmp_file" "$pkgbuild"

updpkgsums
makepkg --printsrcinfo > .SRCINFO

echo "已更新到 ${latest_ver}"

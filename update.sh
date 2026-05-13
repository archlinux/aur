#!/usr/bin/env bash
# Bump nono-ai-bin to the latest upstream release.
# Usage: ./update.sh [version]   (no arg = fetch latest tag)
# Requires: pacman-contrib (provides updpkgsums), makepkg

set -euo pipefail

cd "$(dirname "$0")"
command -v updpkgsums >/dev/null || { echo "updpkgsums not found; install pacman-contrib" >&2; exit 1; }

repo='always-further/nono'

if [[ $# -ge 1 ]]; then
  ver="${1#v}"
else
  url="$(curl -fsSLI -o /dev/null -w '%{url_effective}' \
    "https://github.com/${repo}/releases/latest")"
  ver="${url##*/v}"
fi
[[ "$ver" =~ ^[0-9][0-9.]*$ ]] || { echo "Unexpected version: '${ver}'" >&2; exit 1; }

cur="$(awk -F= '/^pkgver=/{print $2; exit}' PKGBUILD)"
if [[ "$cur" == "$ver" ]]; then
  echo "Already at v${ver}; nothing to do."
  exit 0
fi
echo "Bumping ${cur} -> ${ver}"

sed -i -e "s/^pkgver=.*/pkgver=${ver}/" -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

echo "Updated PKGBUILD and .SRCINFO to v${ver}."

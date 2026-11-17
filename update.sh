#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

repo="javy-fernandez/datacraft"
api="https://api.github.com/repos/$repo/releases/latest"
latest=$(curl -fsSL "$api" | jq -r '.tag_name // empty')
current=$(sed -n 's/^pkgver=//p' PKGBUILD)

if [[ -z "$latest" ]]; then
  echo "No release found" >&2
  exit 1
fi

latest=${latest#v}

if [[ "$latest" == "$current" ]]; then
  echo "Already at $current"
  exit 0
fi

if [[ "$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -n1)" != "$latest" ]]; then
  echo "Latest release $latest is older than $current"
  exit 0
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "Working tree is dirty; commit or revert changes first" >&2
  exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

declare -A sums
for arch in x86_64 aarch64; do
  case "$arch" in
    x86_64) asset=x64 ;;
    aarch64) asset=arm64 ;;
  esac
  file="$tmp/DataCraft-$latest-linux-$asset.tar.gz"
  url="https://github.com/$repo/releases/download/v$latest/DataCraft-$latest-linux-$asset.tar.gz"
  echo "Downloading $asset..."
  curl -fsSL -o "$file" "$url"
  sums[$arch]=$(sha256sum "$file" | cut -d' ' -f1)
done

sed -i -E "s/^pkgver=.*/pkgver=$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i -E "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${sums[x86_64]}')/" PKGBUILD
sed -i -E "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${sums[aarch64]}')/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "Update to $latest"
git push origin master

echo "Updated datacraft-bin to $latest"

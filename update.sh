#!/bin/bash
# Checks GitHub for a newer Apps2Samsung release, updates PKGBUILD/.SRCINFO
# accordingly, and commits the result. Meant to be run periodically (e.g.
# from cron or a CI schedule) from within this repo.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

repo="Apps2Samsung/Apps2Samsung"
pkgbuild="PKGBUILD"

current_ver=$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")

release_json=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest")
latest_tag=$(printf '%s' "$release_json" | grep -m1 '"tag_name"' | sed -E 's/.*"tag_name":\s*"v?([^"]+)".*/\1/')

if [[ -z "$latest_tag" ]]; then
	echo "Could not determine latest release tag" >&2
	exit 1
fi

if [[ "$latest_tag" == "$current_ver" ]]; then
	echo "Already up to date (pkgver=$current_ver)"
	exit 0
fi

echo "Updating $current_ver -> $latest_tag"

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

x64_url="https://github.com/$repo/releases/download/v${latest_tag}/Apps2Samsung-v${latest_tag}-linux-x64.tar.gz"
arm64_url="https://github.com/$repo/releases/download/v${latest_tag}/Apps2Samsung-v${latest_tag}-linux-arm64.tar.gz"

curl -fsSL -o "$workdir/x64.tar.gz" "$x64_url"
curl -fsSL -o "$workdir/arm64.tar.gz" "$arm64_url"

sha256_x64=$(sha256sum "$workdir/x64.tar.gz" | cut -d' ' -f1)
sha256_arm64=$(sha256sum "$workdir/arm64.tar.gz" | cut -d' ' -f1)

sed -i \
	-e "s/^pkgver=.*/pkgver=${latest_tag}/" \
	-e "s/^pkgrel=.*/pkgrel=1/" \
	-e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${sha256_x64}')/" \
	-e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${sha256_arm64}')/" \
	"$pkgbuild"

makepkg --printsrcinfo > .SRCINFO

git add "$pkgbuild" .SRCINFO
git commit -m "Update to v${latest_tag}"

echo "Updated to v${latest_tag} and committed."

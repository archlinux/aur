#!/bin/bash
# Checks GitHub for a newer Pomme Launcher release, updates PKGBUILD/.SRCINFO
# accordingly, and commits the result. Meant to be run periodically (e.g.
# from cron or a CI schedule) from within this repo.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

repo="PommeMC/Client"
pkgbuild="PKGBUILD"

current_ver=$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")

latest_tag=$(curl -fsSL "https://api.github.com/repos/$repo/releases" \
	| jq -r '[.[] | select(.tag_name | startswith("launcher-v"))][0].tag_name // empty' \
	| sed -E 's/^launcher-v//')

if [[ -z "$latest_tag" ]]; then
	echo "Could not determine latest launcher release tag" >&2
	exit 1
fi

if [[ "$latest_tag" == "$current_ver" ]]; then
	echo "Already up to date (pkgver=$current_ver)"
	exit 0
fi

echo "Updating $current_ver -> $latest_tag"

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

deb_url="https://github.com/$repo/releases/download/launcher-v${latest_tag}/pomme-launcher-linux-x64-gnu.deb"

curl -fsSL -o "$workdir/pomme.deb" "$deb_url"

sha256=$(sha256sum "$workdir/pomme.deb" | cut -d' ' -f1)

sed -i \
	-e "s/^pkgver=.*/pkgver=${latest_tag}/" \
	-e "s/^pkgrel=.*/pkgrel=1/" \
	-e "s/^sha256sums=.*/sha256sums=('${sha256}')/" \
	"$pkgbuild"

makepkg --printsrcinfo > .SRCINFO

git add "$pkgbuild" .SRCINFO
git commit -m "Update to v${latest_tag}"

echo "Updated to v${latest_tag} and committed."

#!/bin/bash
# Checks GitHub for a newer Hermes WebUI Desktop release, updates PKGBUILD/.SRCINFO
# accordingly, and commits the result. Meant to be run periodically (e.g.
# from cron or a CI schedule) from within this repo.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

repo="hermes-webui/hermes-desktop-rust"
pkgbuild="PKGBUILD"

if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
	echo "Working tree not clean, aborting" >&2
	exit 1
fi

current_ver=$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")

latest_tag=$(curl -fsSL "https://api.github.com/repos/$repo/releases" \
	| jq -r '[.[] | select(.tag_name | startswith("v"))][0].tag_name // empty' \
	| sed -E 's/^v//')

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

asset_url="https://github.com/$repo/releases/download/v${latest_tag}/Hermes.WebUI.Desktop_${latest_tag}_lin_x86_64.deb"

curl -fsSL -o "$workdir/asset" "$asset_url"

sha256=$(sha256sum "$workdir/asset" | cut -d' ' -f1)

sed -i \
	-e "s/^pkgver=.*/pkgver=${latest_tag}/" \
	-e "s/^pkgrel=.*/pkgrel=1/" \
	-e "s/^sha256sums=.*/sha256sums=('${sha256}')/" \
	"$pkgbuild"

makepkg --printsrcinfo > .SRCINFO

echo "Verifying build"
makepkg -f --clean
rm -f ./*.pkg.tar.* ./*.deb
rm -rf pkg src

git add "$pkgbuild" .SRCINFO
git commit -m "Update to v${latest_tag}"

echo "Updated to v${latest_tag} and committed."

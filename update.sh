#!/bin/bash
# Checks PyPI for a newer label-studio release, updates PKGBUILD/.SRCINFO
# accordingly, and commits the result. Meant to be run periodically (e.g.
# from cron or a CI schedule) from within this repo.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

pypi_pkg="label-studio"
pkgbuild="PKGBUILD"

if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
	echo "Working tree not clean, aborting" >&2
	exit 1
fi

current_ver=$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")

release_json=$(curl -fsSL "https://pypi.org/pypi/$pypi_pkg/json")
latest_tag=$(printf '%s' "$release_json" | jq -r '.info.version // empty')

if [[ -z "$latest_tag" ]]; then
	echo "Could not determine latest release version" >&2
	exit 1
fi

if [[ "$latest_tag" == "$current_ver" ]]; then
	echo "Already up to date (pkgver=$current_ver)"
	exit 0
fi

echo "Updating $current_ver -> $latest_tag"

wheel_url=$(printf '%s' "$release_json" | jq -r '.urls[] | select(.packagetype == "bdist_wheel") | .url' | head -n1)
sha256=$(printf '%s' "$release_json" | jq -r '.urls[] | select(.packagetype == "bdist_wheel") | .digests.sha256' | head -n1)

if [[ -z "$wheel_url" || -z "$sha256" ]]; then
	echo "Could not find a wheel for $latest_tag" >&2
	exit 1
fi

# Rewrite the source URL: keep the hashed PyPI path, swap in the new version.
sed -i \
	-e "s|^pkgver=.*|pkgver=${latest_tag}|" \
	-e "s|^pkgrel=.*|pkgrel=1|" \
	-e "s|^source=.*|source=(\"label_studio-\${pkgver}-py3-none-any.whl::${wheel_url%/*}/label_studio-\${pkgver}-py3-none-any.whl\")|" \
	-e "s|^sha256sums=.*|sha256sums=('${sha256}')|" \
	"$pkgbuild"

makepkg --printsrcinfo > .SRCINFO

echo "Verifying build"
makepkg -f --clean
rm -f ./*.pkg.tar.* ./*.whl
rm -rf pkg src

git add "$pkgbuild" .SRCINFO
git commit -m "Update to v${latest_tag}"

echo "Updated to v${latest_tag} and committed."

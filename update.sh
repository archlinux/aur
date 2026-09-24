#!/bin/sh
# Bump PKGBUILD to the latest Photon Studio version.
# Version is taken from the API redirect filename, e.g.
# .../photon/stable/linux/0.1.14/Photon-Studio-0.1.14-linux-x64.flatpak
set -eu
cd "$(dirname "$0")"

url='https://tenzen.studio/api/v1/photon/download?platform=linux&arch=x64'
latest=$(curl -sf -o /dev/null -w '%{redirect_url}' "$url" \
    | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
[ -n "$latest" ] || { echo "ERROR: could not detect latest version" >&2; exit 1; }

cur=$(sed -n 's/^pkgver=//p' PKGBUILD)
if [ "$latest" = "$cur" ]; then
    echo "Already up to date: $cur"
    exit 0
fi

echo "Updating $cur -> $latest"
sed -i "s/^pkgver=.*/pkgver=$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "Done. Review, then: git commit -am \"Update to $latest\" && git push"

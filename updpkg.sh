#!/usr/bin/bash
set -eu
cd "$(dirname "$0")"

VERSION=${1?Missing target version}
VERSION=${VERSION#v}
sed -i -E "s/pkgver=.*/pkgver=${VERSION/-/_}/; s/pkgrel=.*/pkgrel=1/" PKGBUILD
curl -L "https://github.com/modem-dev/hunk/raw/refs/tags/v${VERSION}/CHANGELOG.md" -o CHANGELOG.md
curl -L "https://github.com/modem-dev/hunk/raw/refs/tags/v${VERSION}/LICENSE" -o LICENSES/MIT.txt
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -v .
git commit -m "updpkg: v${VERSION}" -m "https://github.com/modem-dev/hunk/releases/tag/v${VERSION}"

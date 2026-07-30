#!/usr/bin/sh
set -eu
cd "$(dirname "$0")"

VERSION=${1?Missing target version}
sed -i -E "s/pkgver=.*/pkgver=${VERSION}/; s/pkgrel=.*/pkgrel=1/" PKGBUILD
curl -L "https://github.com/modem-dev/hunk/raw/refs/tags/v${VERSION}/CHANGELOG.md" -o hunk.changelog
curl -L "https://github.com/modem-dev/hunk/raw/refs/tags/v${VERSION}/LICENSE" -o LICENSES/MIT.txt
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -v .
git commit -F - << EOF
updpkg: v${VERSION}

https://github.com/modem-dev/hunk/releases/tag/v${VERSION}
EOF

#!/bin/bash
set -e

AUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD="$AUR_DIR/PKGBUILD"
REPO=$(grep '^url=' "$PKGBUILD" | cut -d'=' -f2 | tr -d "'\"")
SLUG="${REPO#https://github.com/}"

# get latest tag from GitHub via git
VERSION=$(git ls-remote --tags --sort="-version:refname" "${REPO}.git" \
    | grep -v '\^{}' | head -1 | sed 's/.*refs\/tags\/v//')

if [ -z "$VERSION" ]; then
    echo "[x] could not fetch latest tag from GitHub"
    exit 1
fi

echo "  [i] latest release: v${VERSION}"

EMPTY_HASH="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
SHA=$(curl -fsSL --retry 10 --retry-delay 5 --retry-all-errors \
    "${REPO}/archive/v${VERSION}.tar.gz" | sha256sum | awk '{print $1}')

if [ -z "$SHA" ] || [ "$SHA" = "$EMPTY_HASH" ]; then
    echo "[x] failed to fetch tarball"
    exit 1
fi

echo "  [i] sha256: $SHA"

sed -i "s/^pkgver=.*/pkgver=${VERSION}/" "$PKGBUILD"
sed -i "s/^sha256sums=.*/sha256sums=('${SHA}')/" "$PKGBUILD"

cd "$AUR_DIR"
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
if git diff --cached --quiet; then
    echo "  [i] AUR already at v${VERSION}, nothing to commit"
else
    git commit -m "update to v${VERSION}"
    git push origin master
fi

echo "  [✓] AUR updated to v${VERSION}"

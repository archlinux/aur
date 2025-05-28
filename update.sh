#!/bin/bash
set -e

pkgctl version upgrade

if git diff --exit-code PKGBUILD &>/dev/null; then
    echo "No changes detected in PKGBUILD"
    exit 0
fi

VERSION=$(source PKGBUILD && echo "$pkgver")

if [[ -z "$VERSION" ]]; then
    echo "Error: Could not extract version from PKGBUILD"
    exit 1
fi

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "feat: update to v${VERSION}"
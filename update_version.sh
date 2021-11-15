#!/usr/bin/env bash
echo "Fetch last version URL"
LAST_VERSION_SOURCE_URL=`curl https://mirror.wazo.io/desktop/wazo-desktop-latest.AppImage -s -L -I -o /dev/null -w '%{url_effective}'`
echo "  => $LAST_VERSION_SOURCE_URL"

echo "Extract version number"
[[ "$LAST_VERSION_SOURCE_URL" =~ [0-9]+\.[0-9]+\.[0-9]+ ]] && LAST_VERSION_NUMBER=${BASH_REMATCH[0]}
echo "  => $LAST_VERSION_NUMBER"

echo "Update pkgver in PKGBUILD"
sed -i 's/pkgver=.*/pkgver='"$LAST_VERSION_NUMBER"'/' PKGBUILD

echo "Download file, compute sha256sum and update in PKGBUILD"
updpkgsums

echo "Update .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Commit to git"
git add PKGBUILD .SRCINFO
git commit -m "Update to $LAST_VERSION_NUMBER"

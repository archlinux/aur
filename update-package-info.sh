#!/bin/bash
current=`grep -oP "(?<=pkgver=).*" PKGBUILD`
pkgver=`curl -fsL https://www.modestchecker.net/Downloads/Version.txt | sed -e 's/-/_/g;s/^v\([a-zA-Z0-9_.-]*\).*/\1/'`
if [ "$current" == "$pkgver" ]; then
	echo "Package is up-to-date -- exiting"
	exit 0
fi

echo "Updating PKGBUILD to version $pkgver"
sed -i "s/^\(pkgver=\).*$/\1$pkgver/" PKGBUILD

# Calculate SHA256 digests
echo "Calculating SHA256 of Modest archive"
MODEST_SHA256=(`curl -fsL https://www.modestchecker.net/Downloads/Modest-Toolset-v${pkgver//_/-}-linux-x64.zip | sha256sum`)
echo "Calculating SHA256 of LICENSE"
LICENSE_SHA256=(`curl -fsL https://www.modestchecker.net/Downloads/License.txt | sha256sum`)
echo "Calculating SHA256 of CHANGELOG"
CHANGELOG_SHA256=(`curl -fsL https://www.modestchecker.net/Downloads/Changes.txt | sha256sum`)

# Include digests in PKGBUILD
sed -i "s/^\(sha256sums=\).*/\1\(\'$LICENSE_SHA256\' \'$CHANGELOG_SHA256\'\)/" PKGBUILD
sed -i "s/^\(sha256sums_x86_64=\).*/\1\(\'$MODEST_SHA256\'\)/" PKGBUILD

echo "Generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Done, good-bye."
exit 0

#!/bin/bash
# table2asn ships an unversioned gzipped binary; the version is only available
# by running it. Skip the ~20MB download when the FTP Last-Modified is unchanged.
set -e

URL="https://ftp.ncbi.nlm.nih.gov/asn1-converters/by_program/table2asn/linux64.table2asn.gz"
PKGNAME="table2asn"
MARKER=".table2asn.lastmod"

REMOTE_LM=$(curl -sIL "$URL" | awk -F': ' 'tolower($1)=="last-modified"{print $2}' | tr -d '\r')
if [ -f "$MARKER" ] && [ "$(cat "$MARKER")" = "$REMOTE_LM" ]; then
    echo "==> Already up to date (FTP file unchanged since last check)!"
    exit 0
fi

echo "==> Checking for new version..."
curl -sL "$URL" -o /tmp/${PKGNAME}.gz
gunzip -c /tmp/${PKGNAME}.gz > /tmp/${PKGNAME}
chmod +x /tmp/${PKGNAME}
# NCBI toolkit uses '-version' (single dash); '--version' just prints usage.
LATEST_VERSION=$(/tmp/${PKGNAME} -version 2>&1 | grep -oP '(?<=: )\d+\.\d+\.\d+' | head -1)
SHA256=$(sha256sum /tmp/${PKGNAME}.gz | awk '{print $1}')
rm -f /tmp/${PKGNAME} /tmp/${PKGNAME}.gz

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not determine version"
    exit 1
fi

echo "$REMOTE_LM" > "$MARKER"

CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "==> Already up to date!"
    exit 0
fi

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Committing changes..."
git add PKGBUILD .SRCINFO
git commit -m "Update to version $LATEST_VERSION"

echo "==> Pushing to AUR..."
GIT_SSH_COMMAND='ssh -4 -o ConnectTimeout=30' git push -u origin master

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"

#!/usr/bin/env bash
set -e

echo "🔍 Fetching latest Google Antigravity Linux release metadata..."

LATEST_URL=$(curl -s https://antigravity.dev/linux | grep -o 'https://edgedl[^"]*Antigravity.tar.gz' | head -n 1)

if [[ -z "$LATEST_URL" ]]; then
  echo "❌ Could not detect latest Antigravity tarball URL."
  exit 1
fi

echo "📥 Latest URL:"
echo "  $LATEST_URL"

NEW_VER=$(echo "$LATEST_URL" | sed -r 's#.*/stable/([0-9.]+)-[0-9]+/.*#\1#')
NEW_ID=$(echo "$LATEST_URL" | sed -r 's#.*/stable/[0-9.]+-([0-9]+)/.*#\1#')

if [[ -z "$NEW_VER" || -z "$NEW_ID" ]]; then
  echo "❌ Failed to parse version or build id from URL."
  exit 1
fi

echo "➡️ New pkgver:      $NEW_VER"
echo "➡️ New _pkgbuild_id: $NEW_ID"

# PKGBUILD update
sed -i "s/^pkgver=.*/pkgver=${NEW_VER}/" PKGBUILD
sed -i "s/^_pkgbuild_id=.*/_pkgbuild_id=${NEW_ID}/" PKGBUILD
sed -i "s#^source=.*#source=(\"Antigravity-${NEW_VER}.tar.gz::${LATEST_URL}\")#" PKGBUILD

echo "📦 Downloading latest tarball..."
wget -O latest.tar.gz "$LATEST_URL"

echo "🔐 Calculating SHA256..."
SHA=$(sha256sum latest.tar.gz | awk '{print $1}')
sed -i "s/^sha256sums=.*/sha256sums=('${SHA}')/" PKGBUILD

echo "📄 Generating .SRCINFO..."
makepkg --printsrcinfo >.SRCINFO

echo "🎉 Update complete."

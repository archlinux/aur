#!/bin/bash
# plink2-bin: PLINK 2.0 pre-releases are date-stamped static binaries served
# from cog-genomics' S3 bucket (no GitHub 'latest' API), so the version and the
# download URL both come from the upstream download page.
set -e

PAGE="https://www.cog-genomics.org/plink/2.0/"

echo "==> Checking for a new PLINK 2.0 alpha..."

HTML=$(curl -s "$PAGE")

# Latest alpha version, e.g. "D: 18 Aug 2026 (a.7.4)" -> "a.7.4"
ALPHA=$(printf '%s' "$HTML" | grep -oE 'D: [^)]*\(a\.[0-9]+\.[0-9]+\)' | grep -oE 'a\.[0-9]+\.[0-9]+' | head -1)
# Generic (non-AVX2) 64-bit Linux build, i.e. the x86_64 link, current alpha folder.
NEW_URL=$(printf '%s' "$HTML" | grep -oE 'https://s3.amazonaws.com/plink2-assets/alpha[0-9]+/plink2_linux_x86_64_[0-9]{8}\.zip' | head -1)

if [ -z "$ALPHA" ]; then
    echo "Error: could not detect the alpha version on $PAGE"
    exit 1
fi
if [ -z "$NEW_URL" ]; then
    echo "Error: could not detect the x86_64 download URL on $PAGE"
    exit 1
fi

NEW_VER="2.0${ALPHA/a./a}"       # "a.7.4" -> "2.0a7.4"
CURRENT_VER=$(grep '^pkgver=' PKGBUILD | cut -d= -f2-)

if [ "$CURRENT_VER" = "$NEW_VER" ]; then
    echo "==> Already up to date ($CURRENT_VER)!"
    exit 0
fi

echo "==> Updating $CURRENT_VER -> $NEW_VER"
sed -i "s|^pkgver=.*|pkgver=$NEW_VER|" PKGBUILD
sed -i "s|^pkgrel=.*|pkgrel=1|" PKGBUILD
# Replace the date-stamped source URL.
sed -i "s|https://s3.amazonaws.com/plink2-assets/alpha[0-9]*/plink2_linux_x86_64_[0-9]*\.zip|$NEW_URL|" PKGBUILD

echo "==> Refreshing checksums (requires pacman-contrib)..."
if command -v updpkgsums >/dev/null 2>&1; then
    updpkgsums
else
    makepkg -g
fi

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VER to $NEW_VER"

#!/bin/bash
# UCSC ships unversioned prebuilt binaries, but each file carries its own
# HTTP Last-Modified date. pkgver is the newest date (YYYYMMDD) across the
# group, so freshness is checked with HEAD requests only — no downloads.
set -e

BASE="https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64"
TOOLS=(blat/blat blat/gfServer blat/gfClient blat/isPcr)

NEWEST=0
for t in "${TOOLS[@]}"; do
    lm=$(curl -sI "$BASE/$t" | awk -F': ' 'tolower($1)=="last-modified"{print $2}' | tr -d '\r')
    [ -n "$lm" ] || { echo "Error: no Last-Modified header for $t"; exit 1; }
    d=$(date -u -d "$lm" +%Y%m%d)
    [ "$d" -gt "$NEWEST" ] && NEWEST=$d
done

CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $NEWEST"

if [ "$CURRENT_VERSION" = "$NEWEST" ]; then
    echo "==> Already up to date!"
    exit 0
fi

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$NEWEST/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $NEWEST"

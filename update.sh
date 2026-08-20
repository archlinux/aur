#!/bin/bash
# metabuli: source build from a git tag pin (the GitHub tag archive omits the
# lib/mmseqs and lib/fasta_validator submodules), so _tag holds the tag's
# commit hash and makepkg fetches the submodules. Version detection uses
# releases/latest; makepkg forbids hyphens in pkgver, so '-' becomes '_'.
set -e

REPO="steineggerlab/Metabuli"
PKGNAME="metabuli"

echo "==> Checking for new version..."

LATEST_TAG=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -oP '"tag_name": "\K[^"]+' | head -1)
LATEST_VERSION=${LATEST_TAG#v}
LATEST_VERSION=${LATEST_VERSION//-/_}

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not fetch latest version"
    exit 1
fi

CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)

echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "==> Already up to date!"
    exit 0
fi

echo "==> Updating to version $LATEST_VERSION..."

# resolve the tag to its commit hash (peel annotated tags); git protocol,
# no API rate limit
HASH=$(git ls-remote "https://github.com/${REPO}.git" "${LATEST_TAG}^{}" | cut -f1)
[ -n "$HASH" ] || HASH=$(git ls-remote "https://github.com/${REPO}.git" "$LATEST_TAG" | cut -f1)
if [ -z "$HASH" ]; then
    echo "Error: could not resolve tag $LATEST_TAG to a commit"
    exit 1
fi
echo "Commit: $HASH"

echo "==> Updating PKGBUILD..."
sed -i "s/^_tag=.*/_tag=$HASH/" PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"

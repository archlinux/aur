#!/usr/bin/env bash
set -euo pipefail

# Release script for mediatek-mt7927-dkms.
#
# Bumps version across PKGBUILD, dkms.conf, and install script,
# rebuilds the package, tags, and pushes. GitHub Actions handles
# release creation, changelog, RPM/DEB builds, and asset upload.
#
# Usage:
#   ./release.sh patch     # bump pkgver minor (2.3 -> 2.4), reset pkgrel=1
#   ./release.sh rel       # bump pkgrel (1 -> 2)
#   ./release.sh 2.5-3     # explicit version

DKMS_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DKMS_DIR"

PKGBUILD="$DKMS_DIR/PKGBUILD"
DKMS_CONF="$DKMS_DIR/dkms.conf"
REPO="jetm/mediatek-mt7927-dkms"

# Read current version
cur_pkgver=$(grep '^pkgver=' "$PKGBUILD" | cut -d= -f2)
cur_pkgrel=$(grep '^pkgrel=' "$PKGBUILD" | cut -d= -f2)
echo "Current version: v${cur_pkgver}-${cur_pkgrel}"

# Determine new version
if (($# == 0)); then
	echo "Usage: $0 patch|rel|<version>"
	echo "  patch   - bump pkgver minor (${cur_pkgver} -> next), reset pkgrel=1"
	echo "  rel     - bump pkgrel (${cur_pkgrel} -> $((cur_pkgrel + 1)))"
	echo "  X.Y-Z   - explicit version"
	exit 1
fi

case "$1" in
patch)
	# Bump minor: 2.3 -> 2.4
	major="${cur_pkgver%%.*}"
	minor="${cur_pkgver#*.}"
	new_pkgver="${major}.$((minor + 1))"
	new_pkgrel=1
	;;
rel)
	new_pkgver="$cur_pkgver"
	new_pkgrel=$((cur_pkgrel + 1))
	;;
*-*)
	new_pkgver="${1%-*}"
	new_pkgrel="${1#*-}"
	;;
*)
	echo "ERROR: Invalid argument '$1'. Use patch, rel, or X.Y-Z"
	exit 1
	;;
esac

new_tag="v${new_pkgver}-${new_pkgrel}"
echo "New version: ${new_tag}"

# Check tag doesn't already exist
if git rev-parse "refs/tags/${new_tag}" >/dev/null 2>&1; then
	echo "ERROR: Tag ${new_tag} already exists"
	exit 1
fi

# Validate remotes
origin_url=$(git remote get-url origin 2>/dev/null || true)
aur_url=$(git remote get-url aur 2>/dev/null || true)
if [[ "$origin_url" != *"github.com"* ]]; then
	echo "ERROR: 'origin' remote must point to GitHub (got: ${origin_url:-<not set>})"
	exit 1
fi
if [[ "$aur_url" != *"aur.archlinux.org"* ]]; then
	echo "ERROR: 'aur' remote must point to AUR (got: ${aur_url:-<not set>})"
	exit 1
fi

# Check working tree is clean (except the files we're about to modify)
if ! git diff --quiet --exit-code -- ':!PKGBUILD' ':!dkms.conf' ':!CHANGELOG.md' ':!.SRCINFO'; then
	echo "ERROR: Working tree has uncommitted changes"
	exit 1
fi

# Bump versions
echo ""
echo "Bumping versions..."

sed -i "s/^pkgver=.*/pkgver=${new_pkgver}/" "$PKGBUILD"
sed -i "s/^pkgrel=.*/pkgrel=${new_pkgrel}/" "$PKGBUILD"
sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${new_pkgver}\"/" "$DKMS_CONF"

echo "  PKGBUILD:  pkgver=${new_pkgver} pkgrel=${new_pkgrel}"
echo "  dkms.conf: PACKAGE_VERSION=\"${new_pkgver}\""

# Verify match
v1=$(grep '^pkgver=' "$PKGBUILD" | cut -d= -f2)
v2=$(grep '^PACKAGE_VERSION=' "$DKMS_CONF" | cut -d'"' -f2)
if [[ "$v1" != "$v2" ]]; then
	echo "ERROR: Version mismatch: PKGBUILD=$v1 dkms.conf=$v2"
	exit 1
fi
# Build package
echo ""
echo "Building package..."
aurgen

# Show what will be committed
echo ""
echo "Changes to commit:"
git diff --stat

# Confirm
echo ""
read -rp "Commit and release ${new_tag}? [y/N] " confirm
if [[ "$confirm" != [yY] ]]; then
	echo "Aborted. Reverting version changes..."
	git checkout -- PKGBUILD dkms.conf
	exit 1
fi

# Commit
git add PKGBUILD dkms.conf .SRCINFO
git commit -m "pkg: Release ${new_tag}"

# Tag
git tag "${new_tag}"

# Push to GitHub first (tag triggers GH Actions: release + RPM/DEB)
echo ""
echo "Pushing to GitHub..."
git push origin master
git push origin "${new_tag}"

# Push to AUR last (so GitHub release exists when AUR users see the update)
echo ""
echo "Pushing to AUR..."
"${DKMS_DIR}/push-aur.sh"

echo ""
echo "Released ${new_tag}"
echo "  AUR: https://aur.archlinux.org/packages/mediatek-mt7927-dkms"
echo "  GitHub Actions will create the release and build packages."
echo "  Track: https://github.com/${REPO}/actions"

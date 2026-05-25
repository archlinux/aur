#!/usr/bin/env bash
# release.sh - bump version and publish waifufetch to GitHub + AUR
#
# Usage: ./release.sh <version>
#   Example: ./release.sh 1.1.0
#
# This script:
#   1. Updates VERSION in waifu, waifufetch, and PKGBUILD
#   2. Downloads tarball and computes SHA256 for PKGBUILD
#   3. Updates fish function version if present
#   4. Commits, tags, and pushes to GitHub + AUR

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <version>"
    echo "  Example: $0 1.1.0"
    exit 1
fi

VERSION="$1"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TMPDIR=""
AUR_TMP=""

# Fish function paths to check for version strings
FISH_FUNCTIONS=(
    "$HOME/.config/fish/functions/waifu.fish"
    "$HOME/.config/fish/functions/waifuBackup.fish"
)

cleanup() {
    [[ -n "$TMPDIR" && -d "$TMPDIR" ]] && rm -rf "$TMPDIR"
    [[ -n "$AUR_TMP" && -d "$AUR_TMP" ]] && rm -rf "$AUR_TMP"
}
trap cleanup EXIT

cd "$REPO_DIR"

# ---- Check state ----
if ! git diff --quiet; then
    echo "Error: Working tree has uncommitted changes. Commit or stash first." >&2
    exit 1
fi

if ! git diff --cached --quiet; then
    echo "Error: Staged but uncommitted changes. Commit first." >&2
    exit 1
fi

# ---- Helper: update VERSION in a file ----
update_version_in() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo "    (skipped: $file not found)"
        return
    fi
    local current
    current=$(grep -m1 '^[[:space:]]*VERSION=' "$file" 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1 || true)
    if [[ -z "$current" ]]; then
        echo "    (skipped: no VERSION= in $file)"
        return
    fi
    if [[ "$current" == "$VERSION" ]]; then
        echo "    Already v$VERSION: $file"
    else
        # Handle both: VERSION="x.y.z" (bash) and # VERSION=x.y.z (fish)
        if grep -q 'VERSION="' "$file"; then
            sed -i "s/^\([[:space:]]*\)VERSION=\"[^\"]*\"/\1VERSION=\"$VERSION\"/" "$file"
        else
            sed -i "s/^\(# \)*VERSION=[0-9.]*/\1VERSION=$VERSION/" "$file"
        fi
        echo "    Updated v$current -> v$VERSION: $file"
    fi
}

# ---- Update VERSION in all script files ----
echo "==> Updating VERSION in scripts to v$VERSION..."
update_version_in "waifu"
update_version_in "waifufetch"

# ---- Update PKGBUILD ----
echo "==> Updating PKGBUILD to v$VERSION..."
sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s|/archive/v.*\.tar\.gz|/archive/v$VERSION.tar.gz|" PKGBUILD

# ---- Download tarball and compute SHA256 ----
echo "==> Downloading tarball from GitHub..."
TMPDIR="$(mktemp -d)"
TARBALL="$TMPDIR/waifufetch-$VERSION.tar.gz"
curl -sL "https://github.com/JGH0/waifufetch/archive/v$VERSION.tar.gz" -o "$TARBALL"
SHA256="$(sha256sum "$TARBALL" | cut -d' ' -f1)"
echo "    SHA256: $SHA256"

sed -i "s/sha256sums=('.*')/sha256sums=('$SHA256')/" PKGBUILD

# ---- Regenerate .SRCINFO ----
echo "==> Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

# ---- Update fish functions (user-local, outside repo) ----
echo "==> Checking fish function versions..."
for f in "${FISH_FUNCTIONS[@]}"; do
    update_version_in "$f"
done

# ---- Check if version tag already exists ----
if git rev-parse "v$VERSION" &>/dev/null; then
    echo "Warning: Tag v$VERSION already exists. Overwriting." >&2
    git tag -d "v$VERSION"
fi

# ---- Commit and tag ----
echo "==> Committing release v$VERSION..."
git add PKGBUILD .SRCINFO waifu waifufetch
git commit -m "aur release v$VERSION"
git tag "v$VERSION"

# ---- Push to GitHub ----
echo "==> Pushing to GitHub (origin)..."
git push origin main
git push origin "v$VERSION"

# ---- Push to AUR ----
echo "==> Pushing to AUR..."
AUR_TMP="$(mktemp -d)"
git clone ssh://aur@aur.archlinux.org/waifufetch.git "$AUR_TMP"
cp PKGBUILD .SRCINFO "$AUR_TMP/"
cd "$AUR_TMP"
git add -A
git commit -m "v$VERSION"
git push origin master

echo ""
echo "========================================="
echo "  waifufetch v$VERSION released!"
echo "  GitHub: https://github.com/JGH0/waifufetch"
echo "  AUR:    https://aur.archlinux.org/packages/waifufetch"
echo "========================================="

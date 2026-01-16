#!/bin/bash
# Script to update the AUR package after a new release
# Usage: ./update-aur.sh [version]
# If version is not provided, uses the latest git tag from the main repo

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MAIN_REPO="${SCRIPT_DIR}/../inventory-system"

# Get version
if [ -n "$1" ]; then
    VERSION="$1"
else
    # Get latest tag from main repo
    VERSION=$(git -C "$MAIN_REPO" describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')
    if [ -z "$VERSION" ]; then
        echo "Error: No version specified and no git tags found in $MAIN_REPO"
        exit 1
    fi
fi

echo "Updating AUR package to version $VERSION"

# Download tarball and compute checksum
TARBALL_URL="https://github.com/tobixen/inventory-md/archive/refs/tags/v${VERSION}.tar.gz"
echo "Downloading $TARBALL_URL ..."
TMPFILE=$(mktemp)
if ! curl -sL "$TARBALL_URL" -o "$TMPFILE"; then
    echo "Error: Failed to download tarball. Is v${VERSION} tagged and pushed?"
    rm -f "$TMPFILE"
    exit 1
fi

SHA256=$(sha256sum "$TMPFILE" | cut -d' ' -f1)
rm -f "$TMPFILE"
echo "SHA256: $SHA256"

# Update PKGBUILD
cd "$SCRIPT_DIR"

cat > PKGBUILD << EOF
# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=inventory-md
pkgver=${VERSION}
pkgrel=1
pkgdesc="A flexible markdown-based inventory management system"
url="https://github.com/tobixen/inventory-md"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=(
    'python-fastapi: API server and chat functionality'
    'python-uvicorn: API server'
    'python-anthropic: Claude AI chat integration'
    'python-pyzbar: Barcode scanning'
    'python-easyocr: OCR text extraction'
)
source=("\${pkgname}-\${pkgver}.tar.gz::https://github.com/tobixen/inventory-md/archive/refs/tags/v\${pkgver}.tar.gz")
sha256sums=('${SHA256}')

build() {
    cd "\${pkgname}-\${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="\${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "\${pkgname}-\${pkgver}"
    python -m installer --destdir="\$pkgdir" dist/*.whl
}
EOF

echo "PKGBUILD updated"

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
echo ".SRCINFO regenerated"

# Show status
echo ""
echo "Files updated. To publish to AUR:"
echo "  cd $SCRIPT_DIR"
echo "  git add PKGBUILD .SRCINFO"
echo "  git commit -m 'Update to $VERSION'"
echo "  git push"

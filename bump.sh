#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get version and build number from arguments
PKGVER="$1"
BUILDNUMBER="$2"

# Validate arguments
if [ -z "$PKGVER" ] || [ -z "$BUILDNUMBER" ]; then
  echo "Error: Missing arguments"
  echo "Usage: $0 <version> <buildnumber>"
  exit 1
fi


# Update version and build number in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=${PKGVER}/" PKGBUILD
sed -i "s/^_buildnumber=.*/_buildnumber=${BUILDNUMBER}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# Calculate checksum from the local tarball (relative to script location)

TARBALL=""
CANDIDATES=(
  "$SCRIPT_DIR/../scripts/bundle_output/namida-v${PKGVER}-beta.linux.tar.gz"
  "$SCRIPT_DIR/../namida/scripts/bundle_output/namida-v${PKGVER}-beta.linux.tar.gz"
)

for candidate in "${CANDIDATES[@]}"; do
  if [ -f "$candidate" ]; then
    TARBALL="$candidate"
    echo "Found tarball at: $TARBALL"
    break
  fi
done

if [ -z "$TARBALL" ]; then
  echo "Warning: Tarball not found in any of:"
  for candidate in "${CANDIDATES[@]}"; do
    echo "  $candidate"
  done
  exit 1
fi

if [ -f "$TARBALL" ]; then
  NEW_SHA256=$(sha256sum "$TARBALL" | awk '{print $1}')
  sed -i "s/^sha256sums=.*/sha256sums=('${NEW_SHA256}')/" PKGBUILD
  echo "Updated sha256sum: ${NEW_SHA256}"
else
  echo "Warning: Tarball not found at $TARBALL"
  echo "Listing $SCRIPT_DIR/../namida/scripts/bundle_output/:"
  ls -la "$SCRIPT_DIR/../namida/scripts/bundle_output/" 2>/dev/null || echo "Directory does not exist"
  exit 1
fi

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit and push to AUR
git add PKGBUILD .SRCINFO
git commit -m "update to v${PKGVER} (build ${BUILDNUMBER})"
git push origin master

echo "Successfully updated namida-bin to v${PKGVER} (build ${BUILDNUMBER})"
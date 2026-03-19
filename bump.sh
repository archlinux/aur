#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get version, build number, and optional tarball path from arguments
PKGVER="$1"
BUILDNUMBER="$2"
TARBALL_PATH="$3"

# Validate arguments
if [ -z "$PKGVER" ] || [ -z "$BUILDNUMBER" ]; then
  echo "Error: Missing arguments"
  echo "Usage: $0 <version> <buildnumber> [tarball_path]"
  exit 1
fi


# Read current values from PKGBUILD
CURRENT_VER=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
CURRENT_BUILD=$(grep "^_buildnumber=" PKGBUILD | cut -d'=' -f2)
CURRENT_REL=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)

# Increment pkgrel if same version+build, otherwise reset to 1
if [ "$CURRENT_VER" = "$PKGVER" ] && [ "$CURRENT_BUILD" = "$BUILDNUMBER" ]; then
  NEW_REL=$((CURRENT_REL + 1))
  echo "Same version and build number — incrementing pkgrel: ${CURRENT_REL} → ${NEW_REL}"
else
  NEW_REL=1
  echo "New version/build — resetting pkgrel to 1"
fi

sed -i "s/^pkgver=.*/pkgver=${PKGVER}/" PKGBUILD
sed -i "s/^_buildnumber=.*/_buildnumber=${BUILDNUMBER}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=${NEW_REL}/" PKGBUILD

# Build candidate list — explicit path first if provided
CANDIDATES=()
if [ -n "$TARBALL_PATH" ]; then
  CANDIDATES+=("$TARBALL_PATH")
fi
CANDIDATES+=(
  "$SCRIPT_DIR/../namida/scripts/bundle_output/namida-v${PKGVER}-beta.linux.tar.gz"
  "$SCRIPT_DIR/../scripts/bundle_output/namida-v${PKGVER}-beta.linux.tar.gz"
)

TARBALL=""
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

NEW_SHA256=$(sha256sum "$TARBALL" | awk '{print $1}')
sed -i "s/^sha256sums=.*/sha256sums=('${NEW_SHA256}')/" PKGBUILD
echo "Updated sha256sum: ${NEW_SHA256}"

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit and push to AUR
git add PKGBUILD .SRCINFO
git commit -m "update to v${PKGVER} (build ${BUILDNUMBER})"
git push origin master

echo "Successfully updated namida-bin to v${PKGVER} (build ${BUILDNUMBER})"
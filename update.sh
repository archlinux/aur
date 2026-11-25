#!/bin/sh
# Updates the package to a published release: sets the version, downloads both release archives to
# compute their checksums, and regenerates .SRCINFO. Review with 'git diff', test with 'makepkg -f',
# then commit and push to the AUR.
#
#   ./update.sh 0.3.0        new upstream version (pkgrel back to 1)
#   ./update.sh              same version: only refresh checksums and .SRCINFO

set -eu
cd "$(dirname -- "$0")"

if [ $# -ge 1 ]; then
    sed -i -e "s/^pkgver=.*/pkgver=$1/" -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
fi

# Reset the checksums so updpkgsums fetches fresh archives for both architectures.
sed -i -e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('SKIP')/" -e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('SKIP')/" PKGBUILD
rm -f protondrive-*-linux-*.tar.gz
updpkgsums

if grep -q "'SKIP'" PKGBUILD; then
    echo "update.sh: a checksum is still SKIP; is the release published?" >&2
    exit 1
fi

makepkg --printsrcinfo > .SRCINFO
echo "Updated to $(sed -n 's/^pkgver=//p' PKGBUILD)-$(sed -n 's/^pkgrel=//p' PKGBUILD)."

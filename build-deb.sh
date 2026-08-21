#!/usr/bin/env bash
# Build a .deb package for mediatek-mt7927-dkms.
# Usage: ./build-deb.sh
#
# Prerequisites: dpkg-deb, make, python3, curl

set -euo pipefail

PKGNAME="mediatek-mt7927-dkms"
VERSION=$(sed -n "s/^PACKAGE_VERSION=\"\(.*\)\"/\1/p" dkms.conf)
# dkms.conf carries no release number, so take it from the PKGBUILD that
# release.sh bumps. Without it every rebuild is labelled -1 and apt sees no
# upgrade between two releases of the same PACKAGE_VERSION.
PKGREL=$(sed -n "s/^pkgrel=\(.*\)/\1/p" PKGBUILD)
PKGREL=${PKGREL:-1}
ARCH="all"
OUTDIR="${PWD}"
BUILDDIR=$(mktemp -d)
STAGEDIR="${BUILDDIR}/${PKGNAME}_${VERSION}_${ARCH}"

trap 'rm -rf "${BUILDDIR}"' EXIT

echo "==> Building ${PKGNAME} ${VERSION} .deb"

# Prepare sources using the Makefile
make download
make sources SRCDIR="${BUILDDIR}/_build"

# Install to staging area
make install \
    SRCDIR="${BUILDDIR}/_build" \
    DESTDIR="${STAGEDIR}" \
    VERSION="${VERSION}"

# Create DEBIAN control files
mkdir -p "${STAGEDIR}/DEBIAN"

cat > "${STAGEDIR}/DEBIAN/control" <<EOF
Package: ${PKGNAME}
Version: ${VERSION}-${PKGREL}
Architecture: ${ARCH}
Maintainer: Javier Tia <floss@jetm.me>
Depends: dkms
Conflicts: btusb-mt7925-dkms, btusb-mt7927-dkms
Section: kernel
Priority: optional
Homepage: https://github.com/jetm/mediatek-mt7927-dkms
Description: DKMS WiFi 7 and Bluetooth 5.4 drivers for MediaTek MT7927
 Builds out-of-tree btusb/btmtk (Bluetooth) and mt76 (WiFi) kernel
 modules with device IDs and patches not yet in mainline Linux.
 Supports kernels 6.17+.
EOF

cat > "${STAGEDIR}/DEBIAN/postinst" <<'EOF'
#!/bin/sh
set -e
DKMS_NAME="mediatek-mt7927"
DKMS_VERSION="@VERSION@"
if [ "$1" = "configure" ]; then
    dkms add -m "${DKMS_NAME}" -v "${DKMS_VERSION}" || true
    dkms build -m "${DKMS_NAME}" -v "${DKMS_VERSION}" || true
    dkms install -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --force || true
fi
EOF
sed -i "s/@VERSION@/${VERSION}/" "${STAGEDIR}/DEBIAN/postinst"
chmod 755 "${STAGEDIR}/DEBIAN/postinst"

cat > "${STAGEDIR}/DEBIAN/prerm" <<'EOF'
#!/bin/sh
set -e
DKMS_NAME="mediatek-mt7927"
DKMS_VERSION="@VERSION@"
if [ "$1" = "remove" ] || [ "$1" = "purge" ]; then
    dkms remove -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --all || true
fi
EOF
sed -i "s/@VERSION@/${VERSION}/" "${STAGEDIR}/DEBIAN/prerm"
chmod 755 "${STAGEDIR}/DEBIAN/prerm"

# Build the .deb
dpkg-deb --root-owner-group --build "${STAGEDIR}" "${OUTDIR}/${PKGNAME}_${VERSION}-${PKGREL}_${ARCH}.deb"

echo "==> Built: ${PKGNAME}_${VERSION}-${PKGREL}_${ARCH}.deb"

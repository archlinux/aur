#!/usr/bin/env bash
# Build an .rpm package for mediatek-mt7927-dkms.
# Usage: ./build-rpm.sh
#
# Prerequisites: rpmbuild, make, python3, curl

set -euo pipefail

SPEC="mediatek-mt7927-dkms.spec"
VERSION=$(sed -n "s/^PACKAGE_VERSION=\"\(.*\)\"/\1/p" dkms.conf)
TOPDIR="${PWD}/rpmbuild"

if ! command -v rpmbuild &>/dev/null; then
    echo >&2 "rpmbuild not found. Install rpm-build:"
    echo >&2 "  Fedora: sudo dnf install rpm-build"
    exit 1
fi

echo "==> Building mediatek-mt7927-dkms ${VERSION} .rpm"

# Create rpmbuild tree
mkdir -p "${TOPDIR}"/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

# Create source tarball
TARNAME="mediatek-mt7927-dkms-${VERSION}"
TARBALL="${TOPDIR}/SOURCES/${TARNAME}.tar.gz"
if command -v git &>/dev/null && git rev-parse --git-dir &>/dev/null 2>&1; then
    git archive --format=tar.gz --prefix="${TARNAME}/" HEAD -o "${TARBALL}"
else
    # Fallback for non-git environments (CI containers)
    tar -czf "${TARBALL}" --transform "s,^\.,$TARNAME," \
        --exclude='.git' --exclude='rpmbuild' --exclude='*.pkg.tar*' .
fi

# Copy spec
cp "${SPEC}" "${TOPDIR}/SPECS/"

# Build
rpmbuild --define "_topdir ${TOPDIR}" --define "_pkg_version ${VERSION}" --nodeps -bb "${TOPDIR}/SPECS/${SPEC}"

echo "==> RPMs:"
find "${TOPDIR}/RPMS" -name '*.rpm' -print

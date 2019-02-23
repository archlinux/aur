#!/usr/bin/env sh

set -euo pipefail

if [ ${#} -lt 1 ]; then
    echo "Usage: ${0} version"
    echo "Example: ${0} 1.2.3"
    exit 1
fi

version=$1
source="http://stellar.cct.lsu.edu/files/hpx_${version}.tar.bz2"
output_file="/tmp/hpx_${version}.tar.bz2"

# Download given version package
wget --output-document ${output_file} ${source}

# Get the checksum
checksum=$(sha512sum ${output_file} | awk '{print $1}')

# Update version and checksum in PKGBUILD
sed -i "s/\(pkgver=\).*/\1${version}/" PKGBUILD
sed -i "s/\(sha512sums=(\"\).*\(\")\)/\1${checksum}\2/" PKGBUILD

# Update .SRCINFO manually. Bigger changes should be done with makepkg
# --printsrcinfo.
sed -i "s/\(pkgver = \).*/\1${version}/" .SRCINFO
sed -i "s/\(sha512sums = \).*/\1${checksum}/" .SRCINFO

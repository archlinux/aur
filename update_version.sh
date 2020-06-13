#!/usr/bin/env bash

set -euo pipefail

if [ ${#} -lt 1 ]; then
    echo "Usage: ${0} version"
    echo "Example: ${0} 1.2.3"
    exit 1
fi

version=$1
source="https://github.com/STEllAR-GROUP/hpx/archive/${version}.tar.gz"
output_file="/tmp/hpx_${version}.tar.gz"

# Download given version package
wget --output-document "${output_file}" "${source}"

# Get the checksum
checksum=$(sha512sum "${output_file}" | awk '{print $1}')

# Update version and checksum in PKGBUILD
sed -i "s/\(pkgver=\).*/\1${version}/" PKGBUILD
sed -i "s/\(sha512sums=(\"\).*\(\")\)/\1${checksum}\2/" PKGBUILD

# Update .SRCINFO manually. Bigger changes should be done with makepkg
# --printsrcinfo.
sed -i "s/\(pkgver = \).*/\1${version}/" .SRCINFO
sed -i "s/\(sha512sums = \).*/\1${checksum}/" .SRCINFO
sed -i "s/\(source = \).*/\1${source//\//\\/}/" .SRCINFO

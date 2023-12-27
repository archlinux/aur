#!/usr/bin/env sh

pkgver="$1"

echo "Create the package for the version ${pkgver}"

echo "Calculate the checksum..."
curl -s -L -o yogo.tar.gz "https://github.com/antham/yogo/releases/download/v${pkgver}/yogo_${pkgver}_linux_amd64.tar.gz"
pkgchecksum=$(md5sum "yogo.tar.gz"|cut -d ' ' -f1)

echo "Update the PKGBUILD file"
sd "pkgver=\d+\.\d+\.\d+" "pkgver=${pkgver}" PKGBUILD
sd "pkgchecksum=[0-9a-f]{32}" "pkgchecksum=${pkgchecksum}" PKGBUILD

echo "Generate the .SRCINFO"
makepkg --printsrcinfo >.SRCINFO

echo "Compile to ensure it's working"
makepkg

echo "Cleaning all temporary files"
git clean -f -d

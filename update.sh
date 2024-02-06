#!/bin/bash -x

git pull

pkgver="${1}"
if [[ -z "${pkgver}" ]]; then
	pkgver=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/apple/foundationdb/releases/latest | cut -d '/' -f 8)
fi

URL="https://github.com/apple/foundationdb/releases/download/${pkgver}/foundationdb-server_${pkgver}-1_amd64.deb"
chksum=$(curl -Ls "${URL}.sha256" | awk '{print $1}')

if [[ $(echo -n "${chksum}" | wc -c) -ne 64 ]]; then
	echo "Cannot download release"
	exit -2
fi

sed -i "s/pkgver=.*/pkgver=${pkgver}/g" PKGBUILD
sed -i "s/sha256sums_x86_64=.*/sha256sums_x86_64=('${chksum}')/g" PKGBUILD

makepkg -f || exit -10
makepkg --printsrcinfo > .SRCINFO || exit -11

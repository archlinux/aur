#!/bin/env sh

repo_url=http://repos.tixeo.com/debian/pool/non-free/t/tixeoclient/
latest_deb_name=$(curl -s ${repo_url} | \
    grep 'amd64\.deb' | \
    cut -d'"' -f2 | \
    tail -1 | \
    tr -d "\n")
latest_deb_url="${repo_url}${latest_deb_name}"
wget -qO "${latest_deb_name}" "${latest_deb_url}" | cut -d' ' -f1
md5=$(md5sum -b "${latest_deb_name}" | cut -d' ' -f1)
rm "${latest_deb_name}"
pkgver=$(echo "${latest_deb_name}" | cut -d_ -f2)
sed -e "s/^pkgver=.\+$/pkgver=${pkgver}/" PKGBUILD | \
sed -e "s/^md5sums=.\+$/md5sums=('${md5}')/" > PKGBUILD.tmp
mv PKGBUILD.tmp PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "pkgver=${pkgver}"
echo "md5sums=('${md5}')"

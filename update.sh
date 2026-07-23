#!/bin/bash

dir=$(dirname $0)

get() {
    sed -n "s|^${1}=||p" ${dir}/PKGBUILD
}

eval $(grep -E '^arch=' ${dir}/PKGBUILD)
archs="${arch[@]}"
eval $(./get_latest $archs)

_Pkgname=$(get _Pkgname)
pkgver="${version}_${updateDate//-/}"

_version=$(get _version)
_update_date=$(get _update_date)
_pkgver="${_version}_${_update_date//-/}"

[ "${pkgver}" = "${_pkgver}" ] && exit

sed -i.old \
    -e "s|_version=.*|_version=${version}|" \
    -e "s|_update_date=.*|_update_date=${updateDate}|" \
    -e "s|^pkgrel=.*$|pkgrel=1|g" \
    $(for arch in $archs; do
        url=$(eval "echo -n \$url_${arch}");
        _appimage="${dir}/${_Pkgname}-${pkgver}-${arch}.AppImage";
        [ -f ${_appimage} ] || ${dir}/download.sh ${url} -sS -o ${_appimage};
        echo -n " -e s|_image_sha256sums_${arch}=.*|_image_sha256sums_${arch}=$(sha256sum ${_appimage} | awk '{print $1}')|";
        echo -n " -e s|_image_url_${arch}=.*|_image_url_${arch}=$(eval "echo -n \$url_${arch}")|"
    done) \
    ${dir}/PKGBUILD

diff PKGBUILD.old PKGBUILD || makepkg --printsrcinfo > .SRCINFO

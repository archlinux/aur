#!/bin/bash

get() {
    sed -n "s|^${1}=||p" PKGBUILD
}

dir=$(dirname $0)

_Pkgname=$(get _Pkgname)
_version=$(get _version)
_update_date=$(get _update_date)
pkgver="${_version}_${_update_date//-/}"

eval $(grep -E '^arch=' PKGBUILD)
for arch in ${arch[@]}; do
    url=$(get _image_url_${arch})
    _appimage="${dir}/${_Pkgname}-${pkgver}-${arch}.AppImage"
    [ -f ${_appimage} ] || ${dir}/download.sh ${url} -sS -o ${_appimage}
    sed -i -e "s|_image_sha256sums_${arch}=.*|_image_sha256sums_${arch}=$(sha256sum ${_appimage} | awk '{print $1}')|" PKGBUILD
done

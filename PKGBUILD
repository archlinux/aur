# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=kde-service-menu-reimage-mod
_pkgname=kde-service-menu-reimage
pkgver=23.01.30
_pkgver=${pkgver}-1658
pkgrel=1
arch=('any')
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'jhead')
url="https://github.com/biglinux/kde-service-menu-reimage"
pkgdesc="Manipulate images e their metadata.
 kde-service-menu-reimage is a package that extends the functionalities of
 Dolphin/Konqueror adding many additionally sensible menu, reachables with right
 click on the files. These actions are related to picture files.
 Copyright (C) 2018-2018 Giuseppe Benigno <giuseppe.benigno@gmail.com>"
source=("https://github.com/biglinux/kde-service-menu-reimage/archive/refs/tags/kde-service-menu-reimage-${_pkgver}.tar.gz")
sha256sums=('bd633918badf30e041440099f65870592f12fa4753dfa0cea337a548258795ed')

package() {
    # Default Folder
        InternalDir="${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}/${_pkgname}"


    # Copy files
    if [ -d "${InternalDir}/usr" ]; then
        cp -r "${InternalDir}/usr" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/etc" ]; then
        cp -r "${InternalDir}/etc" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/opt" ]; then
        cp -r "${InternalDir}/opt" "${pkgdir}/"
    fi
}


# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=kde-service-menu-reimage-mod
_pkgname=kde-service-menu-reimage
pkgver=24.06.15
_pkgver=${pkgver}-0159
pkgrel=2
arch=('x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'jhead')
conflicts=('kde-service-menu-reimage')
url="https://github.com/biglinux/kde-service-menu-reimage"
pkgdesc="Manipulate images e their metadata v. mod"
source=("https://github.com/biglinux/kde-service-menu-reimage/archive/refs/tags/kde-service-menu-reimage-${_pkgver}-${arch}.tar.gz")
sha256sums=('ec2c76635556bc9ac3cc83abdff881ec4698ba7ffb184730d5b633e8f503c7f1')

package() {
    # Default Folder
        InternalDir="${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}-${arch}/${_pkgname}"

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

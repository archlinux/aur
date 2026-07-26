# Maintainer: Bruno Goncalves <bigbruno@gmail.com>
# shellcheck disable=all

pkgname=kde-service-menu-reimage-mod
_pkgname=kde-service-menu-reimage
pkgver=26.01.04
_pkgver=$pkgver-1417
pkgrel=1
arch=('x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'jhead' 'libwebp-utils')
conflicts=('kde-service-menu-reimage')
url="https://github.com/biglinux/kde-service-menu-reimage"
pkgdesc="Manipulate images e their metadata v. mod"
source=("https://github.com/biglinux/kde-service-menu-reimage/archive/refs/tags/kde-service-menu-reimage-${_pkgver}-${arch}.tar.gz")
sha256sums=('13c7f1803c24bb558a8deb9011d11b4a3abc1e78512eff7f5c10eb96c6728baa')

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

# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributor: K?vin Guilloy <kevin@guilloy.ath.cx>
# URL: https://github.com/trollixx/aur-packages

pkgname=qtcreator-src
_pkgver=3.3
pkgver=${_pkgver}.2
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url="http://wiki.qt.io/Category:Tools::QtCreator"
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
source=("https://download.qt.io/official_releases/qtcreator/${_pkgver}/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.gz")
md5sums=('476ff3142c5e8d09fa5f495070f350df')

PKGEXT='.pkg.tar'

package () {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/src/"
    cp -r "qt-creator-opensource-src-${pkgver}" "$pkgdir/usr/src/qtcreator"
}

# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributor: K?vin Guilloy <kevin@guilloy.ath.cx>

pkgname=qtcreator-src
_pkgver=3.3
pkgver=${_pkgver}.0
pkgrel=1
pkgdesc="Source code of QtCreator IDE needed to build plugins"
arch=('any')
url="http://qt-project.org/wiki/Category:Tools::QtCreator"
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
source=("https://download.qt.io/official_releases/qtcreator/${_pkgver}/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.gz")
md5sums=('5e33988908282c779f2e6e4dca2bba3e')

PKGEXT='.pkg.tar'

package () {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/src/"
    cp -r "qt-creator-opensource-src-${pkgver}" "$pkgdir/usr/src/qtcreator"
}

# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributor: K?vin Guilloy <kevin@guilloy.ath.cx>
# URL: https://github.com/trollixx/aur-packages

pkgname=qtcreator-src
pkgver=4.2.1
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url="http://wiki.qt.io/Category:Tools::QtCreator"
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
source=("https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.xz")
sha256sums=('3746d2232fff429da21079abdb68547d0a80bfcee794700c107eec872dae17c0')

PKGEXT='.pkg.tar'

package () {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/src/"
    cp -r "qt-creator-opensource-src-${pkgver}" "$pkgdir/usr/src/qtcreator"
}

# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributor: K?vin Guilloy <kevin@guilloy.ath.cx>
# URL: https://github.com/trollixx/aur-packages

pkgname=qtcreator-src
pkgver=4.5.1
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url="http://wiki.qt.io/Category:Tools::QtCreator"
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
source=("https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.xz")
sha256sums=('9190c9e5af1a731437ffe63f2533e5d47c44777bf1a22ed90de7013610a3ddf7')

package () {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/src/"
    cp -r "qt-creator-opensource-src-${pkgver}" "$pkgdir/usr/src/qtcreator"
}

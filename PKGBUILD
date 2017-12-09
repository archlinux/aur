# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributor: K?vin Guilloy <kevin@guilloy.ath.cx>
# URL: https://github.com/trollixx/aur-packages

pkgname=qtcreator-src
pkgver=4.5.0
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url="http://wiki.qt.io/Category:Tools::QtCreator"
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
source=("https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.xz")
sha256sums=('140256a5d99e9e6060a492699a68118f16afcebce70d4221fabff7215475d9f9')

package () {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/src/"
    cp -r "qt-creator-opensource-src-${pkgver}" "$pkgdir/usr/src/qtcreator"
}

# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=webui
pkgver=1.0.6
pkgrel=1
pkgdesc="Open source project to use web browsers as UI."
arch=('x86_64')
url="https://github.com/alifcommunity/webui/"
license=('LGPL3')
depends=('boost')
source=("https://github.com/alifcommunity/webui/archive/refs/tags/v1.0.6.tar.gz")
md5sums=('SKIP')

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake . . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install
}

# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=trealla
pkgver=2.0.16
pkgrel=1
pkgdesc="A compact, efficient Prolog interpreter with ISO compliant aspirations."
arch=('i686' 'x86_64')
url="https://github.com/trealla-prolog/trealla"
license=('MIT')
depends=('glibc' 'readline' 'vim' 'openssl')
makedepends=('gcc' 'make')
source=(https://github.com/trealla-prolog/trealla/archive/v${pkgver}.tar.gz)
sha256sums=('8ef3c61c53d7af0a32ad46d4a0954ea2c2834f1287806405a4464c06df5a08ac')

build() {
    cd $srcdir/trealla-$pkgver

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/trealla-$pkgver/tpl $pkgdir/usr/bin/
}

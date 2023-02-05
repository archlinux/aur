# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=trealla
pkgver=2.8.6
pkgrel=1
pkgdesc="A compact, efficient Prolog interpreter with ISO compliant aspirations."
arch=('i686' 'x86_64')
url="https://github.com/trealla-prolog/trealla"
license=('MIT')
depends=('glibc' 'readline' 'vim' 'openssl')
makedepends=('gcc' 'make')
source=(https://github.com/trealla-prolog/trealla/archive/v${pkgver}.tar.gz)
sha256sums=('0b9420eeb667e8e74f5e00fc62801ef8a840ae6d1b06afb32a49d7605bbd9d6c')

build() {
    cd $srcdir/trealla-$pkgver

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/trealla-$pkgver/tpl $pkgdir/usr/bin/
}

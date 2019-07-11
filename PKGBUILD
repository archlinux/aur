# Maintainer: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: tomxtobin
# Contributor: Earnest
pkgname=tiptop
pkgver=2.3.1
pkgrel=1
pkgdesc='hardware performance counters monitor'
url='http://tiptop.gforge.inria.fr'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libxml2')
makedepends=('byacc')

source=("http://tiptop.gforge.inria.fr/releases/tiptop-$pkgver.tar.gz")

sha1sums=('52ccd0d5dfa0a8a6f692c379e560a394a6f376b9')

build() {
    cd tiptop-"$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd tiptop-"$pkgver"
    make DESTDIR="$pkgdir" install
}

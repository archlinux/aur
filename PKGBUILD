# Maintainer: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: tomxtobin
# Contributor: Earnest
pkgname=tiptop
pkgver=2.3
pkgrel=1
pkgdesc='hardware performance counters monitor'
url='http://tiptop.gforge.inria.fr'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libxml2')
makedepends=('byacc')

source=("http://tiptop.gforge.inria.fr/releases/tiptop-$pkgver.tar.gz")

sha1sums=('810e89f17fcbb0b2247b5f473f0a419e5f80faa3')

build() {
    cd tiptop-"$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd tiptop-"$pkgver"
    make DESTDIR="$pkgdir" install
}

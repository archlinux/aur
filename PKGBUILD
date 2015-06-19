# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=rankwidth
pkgver=0.7
pkgrel=1
pkgdesc="A program that calculates rank-width and rank-decompositions"
arch=(i686 x86_64)
url="https://code.google.com/p/planarity/"
license=(GPL2)
depends=()
makedepends=()
source=("http://pholia.tdi.informatik.uni-frankfurt.de/~philipp/software/rw-$pkgver.tar.gz")
md5sums=('58695835a1b5aaa3935143feabc8619a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}


# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=tdlib
pkgver=0.5.0
pkgrel=1
pkgdesc="Algorithms for computing tree decompositions of graphs"
arch=(any)
url="http://www.tdi.informatik.uni-frankfurt.de/~lukas/tdlib.html"
license=(GPL2)
depends=()
source=("http://www.tdi.informatik.uni-frankfurt.de/~lukas/data/$pkgname-$pkgver.tar.gz")
md5sums=('771fd79bd3d98959820a87285a34d9b6')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}

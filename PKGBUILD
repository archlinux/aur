# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=gdome2
pkgver=0.8.1
pkgrel=1
pkgdesc="DOM level2 library for accessing XML files"
arch=('any')
url="http://gdome2.cs.unibo.it"
license=(LGPL)
depends=()
makedepends=()
source=("http://gdome2.cs.unibo.it/tarball/gdome2-0.8.1.tar.gz")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  DESTDIR="$pkgdir" make install
}

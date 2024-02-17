pkgname=cubature
pkgver=1.0.4
pkgrel=1
pkgdesc="multi-dimensional adaptive integration in C "
license=('GPL-2.0-or-later')
arch=('any')
url="https://github.com/stevengj/cubature"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/stevengj/cubature/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd4899de0b047a9d220cfb751a8bdbb8fd0c97c1c894d07523b75168e6426f60')

build() {
  cd cubature-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd cubature-$pkgver
  make install DESTDIR="$pkgdir"
}

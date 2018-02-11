# Maintainer: Luca P <meti at lplab.net>

pkgname=hss
pkgver=1.6
pkgrel=1
arch=(x86_64)
pkgdesc="Interactive ssh client for multiple servers."
url="https://github.com/six-ddc/hss"
license=('GPL')
depends=(readline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/six-ddc/hss/archive/v$pkgver.tar.gz")
sha256sums=('8516f3e24c9908f9c7ac02ee5247ce78f2a344e7fcca8a14081a92949db70049')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make INSTALL_BIN="$pkgdir" install
}

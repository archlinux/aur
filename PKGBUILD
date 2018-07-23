# Maintainer: Phosphenius <luca dot kredel at web dot de>
pkgname=lerpc
pkgver=0.1.0
pkgrel=1
pkgdesc="Does linear interpolation (lerp) between HTML color codes"
arch=('any')
url="https://github.com/Phosphenius/lerpc"
license=('MIT')
source=("https://github.com/Phosphenius/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ff9d3408f3be689285566ea2046ae4d5')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

pkgname=rapidcsv
pkgver=8.90
pkgrel=1
pkgdesc="C++ CSV parser library"
arch=('any')
url="https://github.com/d99kris/rapidcsv"
license=('BSD')
source=($pkgver-$pkgname.h::https://raw.githubusercontent.com/d99kris/rapidcsv/refs/tags/v${pkgver}/src/rapidcsv.h)
sha256sums=('546f06af0d56226285ef3fda81ef6284f8154ea8d2a1628da12321ad070e70cf')

package() {
  cd "$srcdir"
  install -d "${pkgdir}"/usr/include
  install -D -m644 $pkgver-$pkgname.h "${pkgdir}"/usr/include/$pkgname.h
}

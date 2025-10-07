pkgname=rapidcsv
pkgver=8.89
pkgrel=1
pkgdesc="C++ CSV parser library"
arch=('any')
url="https://github.com/d99kris/rapidcsv"
license=('BSD')
source=($pkgver-$pkgname.h::https://raw.githubusercontent.com/d99kris/rapidcsv/refs/tags/v${pkgver}/src/rapidcsv.h)
sha256sums=('9b49953b2a852e0f068339e23d3317541f2de831be5d6a8d5ab645c1a0b79f25')

package() {
  cd "$srcdir"
  install -d "${pkgdir}"/usr/include
  install -D -m644 $pkgver-$pkgname.h "${pkgdir}"/usr/include/$pkgname.h
}

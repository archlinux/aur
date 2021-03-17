# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Moritz Kaspar Rudert (mortzu)

pkgname=libcrystalhd
pkgver=20131127
pkgrel=3
pkgdesc="Broadcom Crystal HD library"
arch=('i686' 'x86_64')
url="https://github.com/crystalhd-arch/libcrystalhd"
license=('LGPLv2.1')
source=("https://github.com/crystalhd-arch/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f905f000a42bd04507439ebcb4f3ce0fe28482c69c56c54cd83dc7de22c62a5630e2e229b730a1577c1a817d8cfaef7f9146eb577b1cbc3de6c8190a5157cea2')


build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:syntax=sh

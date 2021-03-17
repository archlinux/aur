# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Moritz Kaspar Rudert (mortzu)

pkgname=libcrystalhd
pkgver=20131127
pkgrel=4
pkgdesc="Broadcom Crystal HD library"
arch=('i686' 'x86_64')
url="https://github.com/crystalhd-arch/libcrystalhd"
depends=('crystalhd-headers')
license=('LGPLv2.1')
source=("https://github.com/crystalhd-arch/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('28009f24a92d7e6969a2f05ac65712fbd1511880a3c7b3fe1d01d81f7500f86985e9bb86b56047508e651fef5d1cef19aadb9ec844d9a83dba76ea02c14b2af0')


build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:syntax=sh

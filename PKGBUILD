pkgname=prips
pkgver=0.9.9
pkgrel=1
pkgdesc="Prints IP subnet ranges by list or CIDR"
arch=('i686' 'x86_64')
url="http://packages.debian.org/stable/net/prips"
license=('GPL')
source=(http://ftp.de.debian.org/debian/pool/main/p/prips/prips_$pkgver.orig.tar.bz2)
md5sums=('9b106d8a6a101cb82931c5014a6c10da')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 prips "$pkgdir/usr/bin/prips"
  install -Dm644 prips.h "$pkgdir/usr/include/prips.h"
}

# vim:set ts=2 sw=2 et:

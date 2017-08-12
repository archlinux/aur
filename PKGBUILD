# Maintainer: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: mortzu
pkgname=prips
pkgver=1.0.1-1
pkgrel=2
pkgdesc="Prints IP subnet ranges by list or CIDR"
arch=('x86_64')
url="http://packages.debian.org/stable/net/prips"
license=('GPL')
source=(http://http.debian.net/debian/pool/main/p/prips/prips_1.0.1.orig.tar.xz)
md5sums=('646d222bd0b29db766d656df5c8ea1dc')

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

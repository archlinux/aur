# Maintainer: Martin Fritzsche <aur at mafri dot org>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
pkgname=prips
pkgver=1.1.1
pkgrel=1
pkgdesc="Prints IP subnet ranges by list or CIDR"
arch=('x86_64')
url="http://packages.debian.org/stable/net/prips"
license=('GPL')
source=(http://http.debian.net/debian/pool/main/p/prips/prips_1.1.1.orig.tar.xz)
md5sums=('c6577271a818035f4fd25aadfa9cef96')

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

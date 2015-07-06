# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=etherdump
pkgver=2.11
pkgrel=1
pkgdesc="An extremely small packet sniffer."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/etherdump/"
license=('GPL')
source=(http://psydev.syw4e.info/new/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('74013efee212baa8860eda10187aed78')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 etherdump $pkgdir/usr/bin/etherdump
  install -Dm 644 README $pkgdir/usr/share/doc/etherdump/README
}

# vim:set ts=2 sw=2 et:

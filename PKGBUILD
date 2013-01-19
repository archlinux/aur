# Maintainer: jjacky
pkgname=dapper
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop Applications Autostarter"
arch=('i686' 'x86_64')
url="http://jjacky.com/dapper"
license=('GPL3+')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5ce747c362cf07dbb0291fc051479b87')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

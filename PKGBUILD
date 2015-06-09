# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>
pkgname=fsv2
pkgver=1.1.0
pkgrel=1
pkgdesc="gtk2 port of fsv"
arch=('i686' 'x86_64')
url="http://fedorchenko.net/fsv2.php"
license=('LGPL')
depends=('gtkglarea' 'gtkmm' 'ftgl')
options=('!libtool')
source=("http://fedorchenko.net/src/$pkgname-$pkgver.tar.bz2")
md5sums=('3a8e5e6a9b2e5cdc7a111765a2f18599')

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

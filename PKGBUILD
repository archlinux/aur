# Maintainer: jjacky
pkgname=natsort
pkgver=0.1.0
pkgrel=1
pkgdesc="Natural Sorting utility"
arch=('i686' 'x86_64')
url="https://github.com/jjk-jacky/natsort"
license=('GPL3+')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('81cfe73998405843e3d4092c10523530')

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

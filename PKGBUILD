# Maintainer: jjacky
pkgname=molt
pkgver=0.0.1
pkgrel=2
pkgdesc="batch renaming utility"
arch=('i686' 'x86_64')
url="http://jjacky.com/molt"
license=('GPL3+')
depends=('glib2')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('2a528fb8c9534a35c76fa28c20ad36d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

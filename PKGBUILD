# Maintainer: Mladen Pejaković <pejakm at autistici dot org>
# Contributor: Slobodan Terzić <githzerai06 at gmail dot com>

pkgname=aspell-sr
pkgver=0.02
pkgrel=1
pkgdesc="Serbian dictionary for aspell"
arch=('any')
depends=('aspell')
url="http://aspell.net/"
license=('LGPL')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/sr/aspell6-sr-$pkgver.tar.bz2)
md5sums=('a068ba095e7246fd3bbc92e7d0287998')

build() {
  cd $srcdir/aspell6-sr-$pkgver
  ./configure
  make
}
 
package() {
  cd $srcdir/aspell6-sr-$pkgver
  make DESTDIR=$pkgdir install
}

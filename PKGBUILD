# Maintainer: jjacky
pkgname=dapper
pkgver=0.1.2
pkgrel=1
pkgdesc="Desktop Applications Autostarter"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/dapper"
license=('GPL3+')
source=(https://bitbucket.org/jjacky/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('ec231a32217585fae471fad468cdf310')

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

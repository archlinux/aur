# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=puf
pkgver=1.0.0
pkgrel=1
pkgdesc="puf is similar to GNU wget but it is able to download files in parallel."
arch=('i686' 'x86_64')
url="http://puf.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/puf/puf-1.0.0.tar.gz)
md5sums=('78f870f2a0c611ace8c5e9ced7b08a83')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: M0Rf30

pkgname=partclone-utils
pkgver=0.2.1
pkgrel=2
pkgdesc="Utility for use with partclone generated images."
arch=('i686' 'x86_64')
url="http://www.idealworldinc.com/partclone-utils/"
license=(GPL)
source=(http://www.idealworldinc.com/$pkgname/$pkgname.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('4c27d7fb4680cdcfe5871f2bdcd4475d')

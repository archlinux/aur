# Maintainer: M0Rf30

pkgname=partclone-utils
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility for use with partclone generated images."
arch=('i686' 'x86_64')
url="http://www.idealworldinc.com/partclone-utils/"
license=(GPL)
source=("https://sourceforge.net/projects/partclone-utils/files/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('8ab22dfad00559533bc6694f756d6070')

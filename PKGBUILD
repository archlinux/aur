# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Maintainer: Bruno Carnazzi <bcarnazzi@gmail.com>
pkgname=regionset
pkgver=0.2
pkgrel=4
pkgdesc="read/sets the region code of DVD drives"
arch=('i686' 'x86_64')
url="http://linvdr.org/projects/regionset/"
license=('GPL')
source=(http://linvdr.org/download/regionset/$pkgname-$pkgver.tar.gz)
md5sums=('a908ba16ca948512df22250f3d500073')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  install -D -m 755 $srcdir/$pkgname-$pkgver/regionset $pkgdir/usr/bin/regionset
}

# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmstickynotes
pkgver=0.3
pkgrel=1
pkgdesc="A dock app for keeping small notes around the desktop"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://sourceforge.net/projects/wmstickynotes/"
depends=('gtk2')
source=("http://downloads.sourceforge.net/wmstickynotes/wmstickynotes-0.3.tar.gz")
md5sums=('088bd3e1d42f98c34d4f34cb480faf4b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: set sw=2 et:

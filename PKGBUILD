# Maintainer: Cyril Garsaud <cyril.garsaud@gmail.com>

pkgname=caffeinate
pkgver=1.0.0
pkgrel=2
pkgdesc="Command to stop your computer from going to sleep or locking screen"
arch=('any')
url="https://github.com/garsaud/caffeinate"
license=('GPL-3.0-or-later')
depends=('libxtst')
source=(https://github.com/garsaud/caffeinate/archive/refs/tags/v1.0.0.tar.gz)
sha256sums=('3c8a3f6c1da0aaa71ef9879dd27ea1dffc23640c02730d968ee40f9ed82eb426')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr/bin" install
}

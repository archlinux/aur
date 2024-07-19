# Maintainer: Cyril Garsaud <cyril.garsaud@gmail.com>

pkgname=caffeinate
pkgver=1.0.0
pkgrel=1
pkgdesc="Command to stop your computer from going to sleep or locking screen"
arch=('any')
url="https://github.com/garsaud/caffeinate"
license=('GPL-3.0-or-later')
depends=('libxtst')
source=(https://github.com/garsaud/caffeinate/archive/refs/tags/v1.0.0.tar.gz)
sha256sums=('c8bde802854899ad369663e1244bcb74b0a368f09cf8c586bd5a36b89b49888b')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

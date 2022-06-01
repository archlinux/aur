# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: archlinux.info:tdy

pkgname=python-chess
pkgver=1.9.1
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("1d365ac6c8cf6ad8aa2a8f79c0003814e58cddacc14c6222a315c11481ca85f6")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

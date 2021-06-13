# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: archlinux.info:tdy

pkgname=python-chess
pkgver=1.6.1
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("2f8f7574f963df7e23cd4c442715285c2e40a5d43373ef04ea4daa344f03c537")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

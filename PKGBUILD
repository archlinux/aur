# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: archlinux.info:tdy

pkgname=python-chess
pkgver=1.4.0
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("9d897cd3faa446602f1a48c40b93a85ee1948d9b01431083b2dca10cfd1d129b")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

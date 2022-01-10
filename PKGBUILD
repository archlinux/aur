# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: archlinux.info:tdy

pkgname=python-chess
pkgver=1.8.0
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("9417626382fc9240dae9fd64e506c7ab996fa3b07c81e1bcaa804be7b2e13941")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

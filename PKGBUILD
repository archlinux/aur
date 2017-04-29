# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ore_algebra
pkgver=0.3
pkgrel=1
pkgdesc="An implementation of Ore algebras for Sage"
arch=(any)
url="http://www.risc.jku.at/research/combinat/software/ore_algebra/"
license=(GPL)
depends=(sage-mathematics)
makedepends=()
source=("http://mirrors.mit.edu/sage/spkg/upstream/ore_algebra/ore_algebra-$pkgver.tgz")
sha256sums=('2fef1c9aeea1384098b7e2b46d2ba707af009541e15242d0c9bbbaf01f736e88')

package() {
  cd src
  python2 setup.py install --root="$pkgdir" --optimize=1
}

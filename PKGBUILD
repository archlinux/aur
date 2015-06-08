# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ore_algebra
pkgver=0.2
pkgrel=1
pkgdesc="An implementation of Ore algebras for Sage"
arch=(any)
url="http://www.risc.jku.at/research/combinat/software/ore_algebra/"
license=(GPL)
depends=(sage-mathematics)
makedepends=()
source=("http://www.risc.jku.at/research/combinat/software/$pkgname/$pkgname-$pkgver.spkg")
md5sums=('4fb623fe037919d324c1eff4d7e469cd')

package() {
  cd $pkgname-$pkgver/src
  python2 setup.py install --root="$pkgdir" --optimize=1
}

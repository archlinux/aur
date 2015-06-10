# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-gearman
pkgver=2.0.2
pkgrel=1
pkgdesc="Gearman API - Client, worker, and admin client interfaces"
arch=('any')
url="http://pypi.python.org/pypi/gearman/"
license=('apache')
depends=('python2')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/g/gearman/gearman-${pkgver}.tar.gz)
md5sums=('3847f15b763dc680bc672a610b77c7a7')

build() {
  cd "$srcdir/gearman-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/gearman-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:

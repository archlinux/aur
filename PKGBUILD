# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=funcsigs
pkgname=python-funcsigs
pkgver=1.0.2
pkgrel=2
pkgdesc="Python function signatures from PEP362"
arch=('any')
url="https://pypi.python.org/pypi/funcsigs/"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/$_realname-$pkgver.tar.gz")
md5sums=('7e583285b1fb8a76305d6d68f4ccc14e')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:

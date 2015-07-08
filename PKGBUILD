# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-funcsigs
pkgver=0.4
pkgrel=1
pkgdesc="Python function signatures from PEP362"
arch=('any')
url="https://pypi.python.org/pypi/funcsigs/"
license=('Apache')
depends=('python')
source=(https://pypi.python.org/packages/source/f/funcsigs/funcsigs-${pkgver}.tar.gz)
sha256sums=('d83ce6df0b0ea6618700fe1db353526391a8a3ada1b7aba52fed7a61da772033')


package() {
  cd "$srcdir/funcsigs-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:

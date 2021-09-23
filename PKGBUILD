# Maintainer: Jose Riha <jose1711 gmail com>
 
pkgname=python-pyscreeze
pkgver=0.1.28
pkgrel=1
pkgdesc="A simple, cross-platform screenshot module for Python 2 and 3."
arch=('any')
url="https://github.com/asweigart/pyscreeze"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow')
source=(https://pypi.python.org/packages/source/P/PyScreeze/PyScreeze-${pkgver}.tar.gz)
md5sums=('a61a1b9168af328b6581dbc63acc28f9')

package() {
  cd "$srcdir/PyScreeze-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

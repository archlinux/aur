# Maintainer: Jose Riha <jose1711 gmail com>
 
pkgname=python-pyscreeze
pkgver=0.1.29
pkgrel=1
pkgdesc="A simple, cross-platform screenshot module for Python 2 and 3."
arch=('any')
url="https://github.com/asweigart/pyscreeze"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow')
source=(https://pypi.python.org/packages/source/P/PyScreeze/PyScreeze-${pkgver}.tar.gz)
md5sums=('dd13884658f8216150cd97bbc99eecb2')

package() {
  cd "$srcdir/PyScreeze-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

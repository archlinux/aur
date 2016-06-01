pkgname=python-pyscreeze
pkgver=0.1.8
pkgrel=2
pkgdesc="A simple, cross-platform screenshot module for Python 2 and 3."
arch=('any')
url="https://github.com/asweigart/pyscreeze"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow')
source=(https://pypi.python.org/packages/source/P/PyScreeze/PyScreeze-${pkgver}.zip)
md5sums=('f5a7cf7b813af6a21abb31fd02d37ca4')

package() {
  cd "$srcdir/PyScreeze-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

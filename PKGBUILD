# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-pymsgbox
pkgver=1.0.9
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes."
arch=("any")
url="https://github.com/asweigart/pymsgbox"
license=("BSD")
makedepends=("python-setuptools")
depends=("tk")
source=(https://pypi.python.org/packages/source/P/PyMsgBox/PyMsgBox-${pkgver}.tar.gz)
md5sums=('007677929ce311e52e442dadb31ca669')

package() {
  cd "$srcdir/PyMsgBox-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-pymsgbox
pkgver=1.0.6
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes."
arch=("any")
url="https://github.com/asweigart/pymsgbox"
license=("BSD")
makedepends=("python-setuptools")
depends=("tk")
source=(https://pypi.python.org/packages/source/P/PyMsgBox/PyMsgBox-${pkgver}.zip)
md5sums=('c46caf8d2b6daf88a639cd345c051ce1')

package() {
  cd "$srcdir/PyMsgBox-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-pymsgbox
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes."
arch=("any")
url="https://github.com/asweigart/pymsgbox"
license=("BSD")
makedepends=("python-setuptools")
depends=("tk")
source=(https://pypi.python.org/packages/source/P/PyMsgBox/PyMsgBox-${pkgver}.tar.gz)
md5sums=('7d7eec1ff3d186f068629de83d79a710')

package() {
  cd "$srcdir/PyMsgBox-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

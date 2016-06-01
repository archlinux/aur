pkgname=python-pymsgbox
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes."
arch=("any")
url="https://github.com/asweigart/pymsgbox"
license=("BSD")
makedepends=("python-setuptools")
depends=("tk")
source=(https://pypi.python.org/packages/source/P/PyMsgBox/PyMsgBox-${pkgver}.zip)
md5sums=('f4fa9fece7c1250cd7cb9cdc7cbabeb1')

package() {
  cd "$srcdir/PyMsgBox-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

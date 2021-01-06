pkgname=python-pyqt6-sip
pkgver=13.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="The sip module support for PyQt6"
url="https://riverbankcomputing.com/software/pyqt/intro"
license=('GPL')
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/P/PyQt6-sip/PyQt6_sip-$pkgver.tar.gz")
sha256sums=('889edbcd912df815946a1958e1cb218d36f414bf06e863411ee70bee7e76b4c9')

build() {
  cd PyQt6_sip-$pkgver
  python setup.py build
}

package()  {
  cd PyQt6_sip-$pkgver
  python setup.py install --root="$pkgdir"
}

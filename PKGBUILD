pkgname=python-pyautogui
pkgver=0.9.31
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-xlib')
source=(https://pypi.python.org/packages/source/P/PyAutoGUI/PyAutoGUI-${pkgver}.zip)
md5sums=('ae5c9468911863bd9d174642abd5bc18')

package() {
  cd "$srcdir/PyAutoGUI-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}


pkgname=python-pyautogui
pkgver=0.9.33
pkgrel=2
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-xlib' 'python-pillow' 'python-pyscreeze' 'python-pytweening' 'python-pymsgbox')
source=(https://pypi.python.org/packages/source/P/PyAutoGUI/PyAutoGUI-${pkgver}.zip)
md5sums=('c0c83ce432e1099ebc3ace31001edcee')

package() {
  cd "$srcdir/PyAutoGUI-${pkgver}"
  python setup.py install --root="$pkgdir"  --optimize=1
}


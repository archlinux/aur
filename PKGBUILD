pkgname=python-pyautogui
pkgver=0.9.38
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-xlib' 'python-pillow' 'python-pyscreeze' 'python-pytweening' 'python-pymsgbox')
source=("https://pypi.io/packages/source/P/PyAutoGUI/PyAutoGUI-${pkgver}.tar.gz")
md5sums=('9e0e167154f9fd2b13c8155a53dc12df')

package() {
  cd "$srcdir/PyAutoGUI-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}


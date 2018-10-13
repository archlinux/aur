pkgname=('python-pyautogui' 'python2-pyautogui')
pkgver=0.9.38
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-xlib' 'python-pillow' 'python-pyscreeze' 'python-pytweening' 'python-pymsgbox')

source=("https://pypi.io/packages/source/P/PyAutoGUI/PyAutoGUI-${pkgver}.tar.gz")
sha256sums=('52dae786359a51f6dcd64037fe0d703bb86e881059fe99af1fe4662cdf0d7d9e')

package_python-pyautogui() {
  cd "$srcdir/PyAutoGUI-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pyautogui() {
  cd "$srcdir/PyAutoGUI-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:

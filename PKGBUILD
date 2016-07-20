pkgname=mu-editor
pkgver=latest
pkgrel=1
pkgdesc='A "micro" editor for MicroPython'
arch=('any')
url='https://github.com/ntoll/mu'
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-qscintilla-qt5' 'python-pycodestyle' 'python-pyflakes' 'python-pyserial' 'qt5-serialport')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/ntoll/mu')
sha256sums=('SKIP')

_gitname='mu'

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

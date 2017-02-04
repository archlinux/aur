pkgname=mu-editor
epoch=1
pkgver=0.9.13
pkgrel=1
pkgdesc='A "micro" editor for MicroPython'
arch=('any')
url='https://codewith.mu/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-qscintilla-qt5' 'python-pycodestyle' 'python-pyflakes' 'python-pyserial' 'qt5-serialport')
makedepends=('python-setuptools')
source=("https://github.com/mu-editor/mu/archive/v$pkgver.tar.gz")
sha256sums=('68361c59c24d700339e41fcab0726883ffa20d3f0937dbfc89d2f08e2515cf41')

package() {
  cd "$srcdir/mu-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

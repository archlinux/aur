# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
pkgname=python2-pyqrcode
pkgver=1.1
pkgrel=1
pkgdesc="A QR code generator written purely in Python with SVG, EPS, PNG and terminal output."
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=('python2')
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/P/PyQRCode/PyQRCode-1.1.tar.gz")
md5sums=('4ff9fe80c20217710c0643c4cd339a8c')

build() {
  cd "$srcdir/PyQRCode-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/PyQRCode-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python38-pyqt5-sip
pkgver=12.11.0
pkgrel=1
arch=(x86_64)
pkgdesc='The sip module support for PyQt5'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
depends=(python38)
makedepends=(python38-setuptools)
source=(https://pypi.python.org/packages/source/P/PyQt5-sip/PyQt5_sip-$pkgver.tar.gz)
sha256sums=('b4710fd85b57edef716cc55fae45bfd5bfac6fc7ba91036f1dcc3f331ca0eb39')
options=(debug)

build() {
  cd PyQt5_sip-$pkgver
  python3.8 setup.py build
}

package()  {
  cd PyQt5_sip-$pkgver
  python3.8 setup.py install --root="$pkgdir"
}

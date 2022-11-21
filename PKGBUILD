# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=python38-pyqt6-sip
pkgver=13.4.0
pkgrel=1
arch=(x86_64)
pkgdesc='The sip module support for PyQt6'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
depends=(python38)
makedepends=(python38-setuptools)
source=(https://pypi.python.org/packages/source/P/PyQt6-sip/PyQt6_sip-$pkgver.tar.gz)
sha256sums=('6d87a3ee5872d7511b76957d68a32109352caf3b7a42a01d9ee20032b350d979')
options=(debug)

build() {
  cd PyQt6_sip-$pkgver
  python3.8 setup.py build
}

package()  {
  cd PyQt6_sip-$pkgver
  python3.8 setup.py install --root="$pkgdir"
}

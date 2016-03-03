# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-quamash
pkgver=0.5.4
pkgrel=1
pkgdesc="Implementation of the asyncio (PEP 3156) event-loop with Qt"
arch=('any')
url="https://github.com/harvimt/quamash"
license=('BSD')
depends=('python-pyqt5')
makedepends=('python-setuptools' 'icu')
source=(https://pypi.python.org/packages/source/Q/Quamash/Quamash-$pkgver.zip)
sha256sums=('adab67960c1135643c5cee74c4cb4d1385869a8ef4058f0e93b644b646f32a8d')

build() {
  cd "$srcdir/Quamash-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Quamash-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:

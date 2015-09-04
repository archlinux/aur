# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-quamash
pkgver=0.5.3
pkgrel=1
pkgdesc="Implementation of the asyncio (PEP 3156) event-loop with Qt"
arch=('any')
url="https://github.com/harvimt/quamash"
license=('BSD')
depends=('python-pyqt4')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/Q/Quamash/Quamash-$pkgver.tar.gz)
md5sums=('af1f34eb94ea0d9719f71a18c0550dea')

build() {
  cd "$srcdir/Quamash-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Quamash-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:

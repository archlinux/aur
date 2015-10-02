# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=python-quamash-qt5
pkgver=0.5.3
pkgrel=2
pkgdesc="Implementation of the asyncio (PEP 3156) event-loop with Qt"
arch=('any')
url="https://github.com/harvimt/quamash"
license=('BSD')
depends=('python-pyqt5')
makedepends=('python-setuptools')
conflicts=('python-quamash')
provides=('python-quamash')
source=(https://pypi.python.org/packages/source/Q/Quamash/Quamash-$pkgver.tar.gz)
md5sums=('af1f34eb94ea0d9719f71a18c0550dea')

package() {
  cd "$srcdir/Quamash-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

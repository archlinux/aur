# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor : Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=python-monotonic
pkgver=1.2
pkgrel=3
pkgdesc="An implementation of time.monotonic() for Python 2 & < 3.3"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha256sums=('da63e17698c87bb1a6846d81b44077249e3c02ff97ff4c1bdf4f1674d1bbea9a')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

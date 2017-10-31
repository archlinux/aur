# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=('python-monotonic' 'python2-monotonic')
pkgver=1.4
pkgrel=1
pkgdesc="An implementation of time.monotonic() for Python 2."
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha512sums=('2ac02b027a41f4635b62508a9a435ffd124d0f0708a93558a6702dc997837e602790ebf6af256434faa15989e9c4ad7d8a27be9fdcf04bb22b451991a7e8cc46')

package_python-monotonic() {
  depends=('python')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-monotonic() {
  depends=('python2')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=('python-monotonic' 'python2-monotonic')
pkgver=1.3
pkgrel=2
pkgdesc="An implementation of time.monotonic() for Python 2."
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha256sums=('47fcccc18ee9f3e80c74553eb9b74579fda8b93c504689427042109039f1e4d9')

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

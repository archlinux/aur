# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=('python-monotonic' 'python2-monotonic')
pkgver=1.5
pkgrel=2
pkgdesc="An implementation of time.monotonic() for Python 2."
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha512sums=('acee69916a82059a027e7bcc03c58deb5ce773a1aff45938699cf09c3ab49b7827c2c01b431593ed76ae49009728c3d52923267eccfc7e15390f8730351a39e2')

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

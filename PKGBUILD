# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=python-monotonic
pkgver=1.5
pkgrel=7
pkgdesc="An implementation of time.monotonic() for Python"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha512sums=('acee69916a82059a027e7bcc03c58deb5ce773a1aff45938699cf09c3ab49b7827c2c01b431593ed76ae49009728c3d52923267eccfc7e15390f8730351a39e2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

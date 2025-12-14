# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=python-monotonic
pkgver=1.6
pkgrel=7
pkgdesc="An implementation of time.monotonic() for Python"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/atdt/monotonic/archive/$pkgver.tar.gz")
sha512sums=('9bb01f4b34ce10b90dee2e49dd70bc37462333e0da9490893bf642ceea9bed5f9bdbd8f59c58350609ac4c89809039d7375f1f1583ab8fbf9c13d4064849ea18')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

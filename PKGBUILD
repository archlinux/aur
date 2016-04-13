# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor : Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=python-monotonic
pkgver=1.0
pkgrel=1
pkgdesc="An implementation of time.monotonic() for Python 2 & < 3.3"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/m/monotonic/monotonic-$pkgver.tar.gz")
sha256sums=('47d7d045b3f2a08bffe683d761ef7f9131a2598db1cec7532a06720656cf719d')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

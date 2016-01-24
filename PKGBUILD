# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor : Erhan SAHIN <erhan@ssahin.net>

_pkgname=monotonic
pkgname=python-monotonic
pkgver=0.6
pkgrel=1
pkgdesc="An implementation of time.monotonic() for Python 2 & < 3.3"
url="https://pypi.python.org/pypi/monotonic"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/m/monotonic/monotonic-$pkgver.tar.gz")
sha256sums=('2bc780a16024427cb4bfbfff77ed328484cf6937a787cc50055b83b13b653e74')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

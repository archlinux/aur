# Maintainer: Oliver Mangold <o dot mangold at gmail dot com>

pkgname=python2-orient
pkgver=1.4.3
pkgrel=1
pkgdesc="Python 2 bindings for OrientDB"
arch=('any')
url=https://github.com/mogui/pyorient
license=('Apache')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/pyorient/pyorient-${pkgver}.tar.gz)
sha256sums=('520ab495419a7f27d5815594df09a08b0921ef6a9ac2b11d7df69387a7e597d6')

build() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

# Maintainer: Oliver Mangold <o dot mangold at gmail dot com>

pkgname=python2-orient
pkgver=1.4.2
pkgrel=1
pkgdesc="Python 2 bindings for OrientDB"
arch=('any')
url=https://github.com/mogui/pyorient
license=('Apache')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/pyorient/pyorient-${pkgver}.tar.gz)
sha256sums=('9ef4b5122f0f602aabf1d99ccc17b50e4bd5b4ed51caae477d6bf9db2b729259')

build() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

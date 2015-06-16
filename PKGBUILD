# Maintainer: Oliver Mangold <o dot mangold at gmail dot com>

pkgname=python2-orient
pkgver=1.4.2a
pkgrel=1
pkgdesc="Python 2 bindings for OrientDB"
arch=('any')
url=https://github.com/mogui/pyorient
license=('Apache')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/pyorient/pyorient-${pkgver}.tar.gz)
sha256sums=('7e5ad4a82caa6d8dfa0be8c0511343242ff0abde70ab007e1e5dc98af8eac084')

build() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/pyorient-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

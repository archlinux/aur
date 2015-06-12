# Contributer: Andrei Antoukh <niwi@niwi.be>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname="py3-bsddb"
pkgver=6.0.0
pkgrel=1
pkgdesc="Python bindings for the excellent Oracle Berkeley DB."
url="http://www.jcea.es/programacion/pybsddb.htm"
license=("BSD")
arch=("i686" "x86_64")
depends=("python3")
source=("http://pypi.python.org/packages/source/b/bsddb3/bsddb3-${pkgver}.tar.gz")
md5sums=('5c963bb3bcb1fe92cd195bf056aa28c2')

build() {
true
}

package() {
  cd ${srcdir}/bsddb3-$pkgver
  /usr/bin/python3 setup.py install --root=$pkgdir
}

# vim: set noet ff=unix

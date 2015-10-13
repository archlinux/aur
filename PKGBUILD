# Maintainer: M0Rf30

_pkgsrcname=txjson-rpc
pkgname=python2-${_pkgsrcname}
pkgver=0.3.1
pkgrel=1
pkgdesc="Code for creating Twisted JSON-RPC servers and clients"
url="https://pypi.python.org/pypi/txJSON-RPC"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/source/t/txJSON-RPC/txJSON-RPC-${pkgver}.tar.gz")

build() {
  cd $srcdir/tx*
  python2 setup.py build
}

package() {
  cd $srcdir/tx*
  python2 setup.py install --prefix=${pkgdir}/usr --root=$pkgdir --optimize=1
}


md5sums=('b9b9e59d1bad30ef15b38a99aa4b3c6e')

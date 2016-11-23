# Maintainer: M0Rf30

_pkgsrcname=txjson-rpc
pkgname=python2-${_pkgsrcname}
pkgver=0.5
pkgrel=1
pkgdesc="Code for creating Twisted JSON-RPC servers and clients"
url="https://pypi.python.org/pypi/txJSON-RPC"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/source/t/txJSON-RPC/txJSON-RPC-${pkgver}.tar.gz")

build() {
  cd $srcdir/txJSON-RPC-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/txJSON-RPC-$pkgver
  python2 setup.py install --prefix=${pkgdir}/usr --root=$pkgdir --optimize=1
}

md5sums=('1dafa2df893d9d068573671d3a87ca9b')

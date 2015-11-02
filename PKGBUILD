# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-thrift
pkgver=0.9.3
pkgrel=1
pkgdesc='Python bindings for the Apache Thrift RPC system'
arch=(i686 x86_64)
license=(ASF)
url='https://thrift.apache.org/'
depends=(python2)
source=(https://pypi.python.org/packages/source/t/thrift/thrift-$pkgver.tar.gz)
sha1sums=('d9e2d709c0da25119bac1d8aba63d3548cf151d2')

package() {
  cd thrift-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-thrift
pkgver=0.9.2
pkgrel=1
pkgdesc='Python bindings for the Apache Thrift RPC system'
arch=(i686 x86_64)
license=(ASF)
url='https://thrift.apache.org/'
depends=(python2)
source=(https://pypi.python.org/packages/source/t/thrift/thrift-$pkgver.tar.gz)
sha1sums=('063de7774f55a9d4d22765416624d973cb27e742')

package() {
  cd thrift-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

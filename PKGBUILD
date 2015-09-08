# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-tarantool
pkgver=0.5.1
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=(any)
license=(BSD)
url='https://github.com/tarantool/tarantool-python'
depends=(python2)
source=(https://pypi.python.org/packages/source/t/tarantool/tarantool-$pkgver.tar.gz)
sha1sums=('9a8e4a23ca8bd2ad101d1e641752a4851655c725')

package() {
  cd tarantool-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

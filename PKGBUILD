# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python-pg8000
pkgver=1.08
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible (Python 3.x version)"
arch=(any)
url="http://pybrary.net/pg8000/"
license=('BSD')
makedepends=('setuptools')
depends=('python')
source=("http://pybrary.net/pg8000/dist/pg8000-py3-$pkgver.tar.gz")

build() {
  cd $srcdir/pg8000-py3-$pkgver
  python3 setup.py install --root=$pkgdir
}
md5sums=('b316a56ffef7737c8807d25afe044dce')

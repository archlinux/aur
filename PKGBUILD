# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python-pg8000
pkgver=1.08
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url="http://pybrary.net/pg8000/"
license=('BSD')
makedepends=('setuptools')
depends=('python')
source=("http://pybrary.net/pg8000/dist/pg8000-$pkgver.tar.gz")
md5sums=('2e8317a22d0e09a6f12e98ddf3bb75fd')

build() {
  cd $srcdir/pg8000-$pkgver
  python setup.py install --root=$pkgdir || return 1
}

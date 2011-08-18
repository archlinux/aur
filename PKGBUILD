# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python2-pg8000
pkgver=1.08
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url="http://pybrary.net/pg8000/"
license=('BSD')
makedepends=('setuptools')
depends=('python2')
source=("http://pybrary.net/pg8000/dist/pg8000-$pkgver.tar.gz")

build() {
  cd $srcdir/pg8000-$pkgver
  python2 setup.py install --root=$pkgdir
}
md5sums=('2e8317a22d0e09a6f12e98ddf3bb75fd')

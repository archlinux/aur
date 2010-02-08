# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python-pg8000
pkgver=1.07
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url="http://pybrary.net/pg8000/"
license=('BSD')
makedepends=('setuptools')
depends=('python')
source=("http://pybrary.net/pg8000/dist/pg8000-$pkgver.tar.gz")
md5sums=('feef7d3c5a15d1a12bcfb29a6169cb5a')

build() {
  cd $srcdir/pg8000-$pkgver
  python setup.py install --root=$pkgdir || return 1
}

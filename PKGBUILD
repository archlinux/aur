# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python2-txpostgres
pkgver=1.0.0
pkgrel=1
pkgdesc="An asynchronous PostgreSQL driver for the Twisted framework, based on psycopg2"
arch=(any)
url="http://txpostgres.readthedocs.org/"
license=('MIT')
makedepends=('python2-distribute')
depends=('twisted')
optdepends=('python2-psycopg2: psycopg2 backend'
            'python2-psycopg2ct: psycopg2-ctypes backend')
source=("http://pypi.python.org/packages/source/t/txpostgres/txpostgres-$pkgver.tar.bz2")

build() {
  cd $srcdir/txpostgres-$pkgver
  python2 setup.py install --root=$pkgdir
}
md5sums=('d710833763b439cf4145f4ae640e6dc0')

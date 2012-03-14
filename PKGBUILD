# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=python2-psycopg2ct
pkgver=2.4.4
pkgrel=1
pkgdesc="psycopg2-compatible database adapter using ctypes (works with PyPy)"
arch=(any)
url="http://pypi.python.org/pypi/psycopg2ct"
license=('LGPL')
makedepends=('python2-distribute')
depends=('python2' 'postgresql-libs')
source=("http://pypi.python.org/packages/source/p/psycopg2ct/psycopg2ct-$pkgver.tar.gz")

build() {
  cd $srcdir/psycopg2ct-$pkgver
  python2 setup.py install --root=$pkgdir
}
md5sums=('249442785ce3e2597358b468e584020c')

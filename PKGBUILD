# Maintainer: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
_pkgname=pg8000-py3
pkgver=1.08
pkgrel=2
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible (Python 3.x version)"
arch=(any)
url="http://pybrary.net/pg8000/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("http://pybrary.net/pg8000/dist/pg8000-py3-$pkgver.tar.gz")
md5sums=('b316a56ffef7737c8807d25afe044dce')

build() {
  cd ${srcdir}/pg8000-py3-${pkgver}
  python3 setup.py build
}

package() {
  cd ${srcdir}/pg8000-py3-${pkgver}
  python3 setup.py install --root=${pkgdir} --optimize=1
}

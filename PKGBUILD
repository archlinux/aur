# Maintainer: Chen Mulong <chenmulong@gmail.com>

pkgname=python-pygresql
pkgver=5.2.1
pkgrel=1
pkgdesc="PyGreSQL is an open-source Python module that interfaces to a PostgreSQL database."
arch=('x86_64')
url="https://pygresql.org/"
license=('PostgreSQL')
depends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c3/eb/11c612ca025554cb3da0dd05114deebb529f609991d7d2f7983331d70c63/PyGreSQL-${pkgver}.tar.gz")
sha256sums=('94cc40538f4e460ca419e07a8ddfb26cf3c291df5d10728c4922135f9703faeb')

build() {
  cd PyGreSQL-$pkgver
  python setup.py build
}

package() {
  cd PyGreSQL-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname=python-sqlalchemy-utils
pkgver=0.32.0
pkgrel=1
pkgdesc="Various utility functions, new data types and helpers for SQLAlchemy."
url="https://github.com/kvesteri/sqlalchemy-utils"
depends=('python' 'python-anyjson' 'python-babel' 'python-arrow' 'python-intervals' 'python-phonenumbers' 'python-passlib' 'python-colour' 'python-ipaddr' 'python-enum34' 'python-dateutil' 'python-furl' 'python-cryptography')
makedepends=('python3')
license=('BSD')
arch=('any')
source=('https://pypi.python.org/packages/source/S/SQLAlchemy-Utils/SQLAlchemy-Utils-0.32.0.tar.gz')
md5sums=('ccf82b341312d60f8df86b54e0fcd023')

build() {
  cd "$srcdir/python-sqlalchemy-utils-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/sqlalchemy-utils-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

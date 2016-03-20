# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=SQLAlchemy-Utils
pkgname=python-sqlalchemy-utils
pkgver=0.32.0
pkgrel=1
pkgdesc='Various utility functions, new data types and helpers for SQLAlchemy.'
url='https://github.com/kvesteri/sqlalchemy-utils'
depends=('python>3.4' 'python-anyjson' 'python-babel' 'python-arrow' 'python-intervals' 'python-phonenumbers' 'python-passlib' 'python-colour' 'python-ipaddr' 'python-dateutil' 'python-furl' 'python-cryptography')
makedepends=('python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/S/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('ccf82b341312d60f8df86b54e0fcd023')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

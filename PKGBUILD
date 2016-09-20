# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=SQLAlchemy-Utils
pkgname=python-sqlalchemy-utils
pkgver=0.32.9
pkgrel=1
pkgdesc='Various utility functions, new data types and helpers for SQLAlchemy.'
url='https://github.com/kvesteri/sqlalchemy-utils'
depends=('python>3.4' 'python-anyjson' 'python-babel' 'python-arrow' 'python-intervals' 'python-phonenumbers' 'python-passlib' 'python-colour' 'python-dateutil' 'python-furl' 'python-cryptography')
makedepends=('python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/4e/85/bf1255b8fdef127a019f1ed7ff174a5f7482bc539f83213cf137eb703f1e/SQLAlchemy-Utils-0.32.9.tar.gz")
md5sums=('58d81cc05dc6eca9233c7aa32d8e3af2')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Bidossessi Sodonon

pkgname=python-psycogreen
_pkgname=psycogreen
pkgver=1.0
pkgrel=1
pkgdesc="psycopg2 integration with coroutine libraries"
url=https://bitbucket.org/dvarrazzo/psycogreen
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('7a32d8f5abdb4ce17ac512f8c8a698a9')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}

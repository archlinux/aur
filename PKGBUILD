# Maintainer: Bidossessi Sodonon

pkgname=python2-psycogreen
_pkgname=psycogreen
pkgver=1.0
pkgrel=1
pkgdesc="psycopg2 integration with coroutine libraries"
url=https://bitbucket.org/dvarrazzo/psycogreen
arch=('any')
license=(BSD)
provides=("$_pkgname")
depends=(
    'python2'
)
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('7a32d8f5abdb4ce17ac512f8c8a698a9')

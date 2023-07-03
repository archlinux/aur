# Maintainer: Tony Benoy <me@tonybenoy.com
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Bidossessi Sodonon

pkgname=python-psycogreen
_pkgname=psycogreen
pkgver=1.0.2
pkgrel=2
pkgdesc="psycopg2 integration with coroutine libraries"
url=https://github.com/psycopg/psycogreen/
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4f6f68ba5ffb1d6908160de3dacd3618')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}

# Maintainer: Ainola
# Contributor: Hugo Osvaldo Barrera
# Contributor: Joel Pedraza

pkgname=python-humblebundle
pkgver=0.1.1
pkgrel=2
pkgdesc="An unofficial library for querying the Humble Bundle API"
arch=('any')
url="https://github.com/saik0/humblebundle-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/${pkgname:7}/${pkgname:7}-${pkgver}.tar.gz")
sha256sums=('82f7724c286abff1dae6586501ac6a30ea4905652006c7e57d68e03450881222')

package() {
  cd "${srcdir}/${pkgname:7}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

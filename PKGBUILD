# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=(python-dbusmock python2-dbusmock)
_pkgname=python-dbusmock
pkgver=0.17.2
pkgrel=1
pkgdesc='Mock D-Bus objects for tests'
arch=(any)
url='https://github.com/martinpitt/python-dbusmock'
license=(LGPL3)
depends=()
makedepends=()
#checkdepends=(python-nose python2-nose)
source=("https://github.com/martinpitt/python-dbusmock/releases/download/0.17.2/python-dbusmock-${pkgver}.tar.gz")
sha256sums=('56860530d647410375c85e69d44a97b563ae2b45cf77656f726030dc20b47e03')

#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  python setup.py test
#  python2 setup.py test
#}

package_python-dbusmock() {
  depends=(python)
  makedepends=(python-setuptools)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-dbusmock() {
  depends=(python2)
  makedepends=(python2-setuptools)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:

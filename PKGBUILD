# Contributor: Erik Johnson <palehose at gmail dot com>
pkgname=python2-rtkit
_realname=python-rtkit
pkgver=0.7.2
pkgrel=1
pkgdesc="Best Practical RT (Request Tracker) data access python module for REST interface."
arch=('any')
url="http://pypi.python.org/pypi/${_realname}/"
license=('Apache')
depends=('python2')
makedepends=('python2-distribute')
source=("https://files.pythonhosted.org/packages/fe/ef/1150337dc095b6ac35e18be546f0cb763e0c369419cf77c237b803b2cb61/${_realname}-${pkgver}.tar.gz")
sha256sums=(c9ae285cbeaa0a896527fccb6ef0b46970beee954abd2a329cf686b1fcfabbdb)

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:

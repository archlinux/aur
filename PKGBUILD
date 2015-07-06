# Contributor: Erik Johnson <palehose at gmail dot com>
pkgname=python2-rtkit
_realname=python-rtkit
pkgver=0.2.1
pkgrel=1
pkgdesc="Best Practical RT (Request Tracker) data access python module for REST interface."
arch=('any')
url="http://pypi.python.org/pypi/${_realname}/"
license=('Apache')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/${_realname}/${_realname}-${pkgver}.tar.gz")
md5sums=('ff84c4d586eaa8111bae1807025e60b3')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:

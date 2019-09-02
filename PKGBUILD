# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Jose Riha <jose1711 gmail com>

_name=dicttoxml
pkgname=python2-dicttoxml
pkgver=1.7.4
pkgrel=2
pkgdesc="Converts a Python dictionary or other native data type into a valid XML string."
url="https://github.com/quandyfactory/dicttoxml"
depends=('python2')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45')

build() {
  cd dicttoxml-${pkgver}
  python2 setup.py build
}

package() {
  cd dicttoxml-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:

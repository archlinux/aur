# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.3.0
pkgrel=1
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/GIJack/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('c3b086bb43077cc9bf3ad1fb9a38551ddd8d3f7e03cf83818b23e71c060570cc')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr
}


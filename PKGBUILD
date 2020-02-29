# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.1.0
pkgrel=1
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/GIJack/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('2d96101500c60d53f3b6e44b87dc8ffd2519e6dab4b077d1929645afaa279511')


package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr
}


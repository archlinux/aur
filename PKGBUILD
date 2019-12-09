# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.0.0
pkgrel=1
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/GIJack/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('a794c99069a1370d3ce4e6b3091aa06c6154a2f7da06ca73d909d3e46cbfa458')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr
}


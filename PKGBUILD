# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.3.1
pkgrel=2
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/GIJack/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('bbe887839bd366b263376a87f40a55523092a9090124c3d5637dc144f9ca51be')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr
}


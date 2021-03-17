# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-generate_mac
_pypiname=python-generate_mac
pkgver=1.3.1
pkgrel=1
pkgdesc="Python Library for Generating Ethernet MAC addresses"
url="https://github.com/GIJack/python-generate_mac"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/GIJack/python-generate_mac/archive/${pkgver}.tar.gz)
sha256sums=('78cd5a3cc10d122ee534f04542ae7cfd9a5d20c7dbf5f64fa82f25791af0840c')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr
}


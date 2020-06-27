# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pypiname=asysocks
pkgver=0.0.4
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/87/ea/2a265b8c071d268836434fc729152ccce8e3a5205558d9fefa7adcfca393/asysocks-${pkgver}.tar.gz")
sha256sums=('a754905b98a8cdad1d53e3cb8092b5df77c8021e1a09623e93ea1a5565494b62')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

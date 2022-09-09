# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pkgname=asysocks
pkgver=0.2.1
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8f4516088ebec7f08d8c549e5e75e7a86b41e6043af920ba4895cf3f6c654150')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

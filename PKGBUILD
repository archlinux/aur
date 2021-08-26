# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pkgname=asysocks
pkgver=0.1.2
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9b33fe5ab6853ed2ac9eb1652f4a8593a78ad5ba258bd10fa4b81801e38729c2')


package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

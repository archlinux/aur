# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pkgname=asysocks
pkgver=0.0.11
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('186c681d26482e6d92a2b8636dc5b09a8657f5ddd25771318944948a27cccf87')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

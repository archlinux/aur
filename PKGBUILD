# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pkgname=asysocks
pkgver=0.0.7
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c7eaa6c178bbd65d590a798ef8fba4f98c2a3240fa0a5fd28b1ec935edca4963')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

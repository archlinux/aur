# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pypiname=asysocks
pkgver=0.0.7
_file="d7/34/c8895dbc82c231a463ca63c1c9b664eb410d6b423885219e336b573f64ab"
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_file}/asysocks-${pkgver}.tar.gz")
sha256sums=('c7eaa6c178bbd65d590a798ef8fba4f98c2a3240fa0a5fd28b1ec935edca4963')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

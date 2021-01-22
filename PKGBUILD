# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pkgname=aiowinreg
pkgver=0.0.4
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://pypi.org/project/aiowinreg"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('956278a90ef6958f9e2392891b2a305273f695b15b14489cd2097197d6cbe155')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

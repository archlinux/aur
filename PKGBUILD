# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pkgname=aiowinreg
pkgver=0.0.7
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://pypi.org/project/aiowinreg"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a191c039f9c0c1681e8fc3a3ce26c56e8026930624932106d7a1526d96c008dd')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

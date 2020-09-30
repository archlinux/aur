# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pkgname=aiowinreg
pkgver=0.0.3
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://pypi.org/project/aiowinreg"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c96a886c3c4634907a2c7abc346ffc62f6372193c11dfd6a0ed9fb426aeab03f')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

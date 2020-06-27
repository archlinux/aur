# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pypiname=aiowinreg
pkgver=0.0.3
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://pypi.org/project/aiowinreg"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/6c/4d/7a2eae3210db5abfe89b7efa0e4f29e803231fe4384a916392f46bdcfb48/aiowinreg-${pkgver}.tar.gz")
sha256sums=('c96a886c3c4634907a2c7abc346ffc62f6372193c11dfd6a0ed9fb426aeab03f')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

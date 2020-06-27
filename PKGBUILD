# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minidump
_pypiname=minidump
pkgver=0.0.13
pkgrel=1
pkgdesc="Python library to parse and read Microsoft minidump file format"
url="https://pypi.org/project/minidump"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/a9/cb/8465e1f2b3ea39764dce7726543ed8519b0bd8cef4aede075298a01e0ac9/minidump-${pkgver}.tar.gz")
sha256sums=('ba8a988f915e53005f8b4747515269e7ab7c937bc74ab09fec949edf04f423f1')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

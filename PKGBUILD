# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pypiname=winacl
pkgver=0.0.6
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/bf/a7/00aeab9ccc901b49786a9e8ca8ae8b22734b3367c58a0093661b460322c6/winacl-${pkgver}.tar.gz")
sha256sums=('9fe05da7c18124ba0e47a39c377e8224dc5e645464cbf257672af522d76d1138')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pkgname=winacl
pkgver=0.1.2
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('187b4394ef247806f50e1d8320bdb9e33ad1f759d9e61e2e391b97b9adf5f58a')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

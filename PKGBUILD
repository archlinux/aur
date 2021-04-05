# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pkgname=winacl
pkgver=0.1.1
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('57e5b4591b4be2b243d4b79882bd0fb6229d5930d062fdae941d5d8af6aa29ee')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

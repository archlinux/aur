# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pkgname=winacl
pkgver=0.1.0
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('97320c6b2c029a884196666e0aa92bdd45936f4db9d54e516330e8bf176cb017')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

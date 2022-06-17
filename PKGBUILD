# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pkgname=winacl
pkgver=0.1.3
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1bac567a9d21300082aa2246bb0f94a591fca8e218e163bab18df0e32eefea06')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

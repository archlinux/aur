# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-ldapdomaindump
_pypiname=ldapdomaindump
pkgver=0.9.3
pkgrel=1
pkgdesc="Active Directory information dumper via LDAP, written in python"
url="https://github.com/dirkjanm/ldapdomaindump/"
arch=('any')
license=('MIT')
depends=('python' 'python-future' 'python-dnspython' 'python-ldap3')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/dirkjanm/ldapdomaindump/archive/v${pkgver}.tar.gz")
sha256sums=('30d269f8c638a1446d7a71d01c41e2a03ea0b9742ada471414db91bd77927f40')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

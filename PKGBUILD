# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-bloodhound
_pkgname=bloodhound
pkgver=1.2.1
pkgrel=1
pkgdesc="Python based ingestor for BloodHound, based on Impacket"
arch=('any')
url="https://github.com/fox-it/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython' 'python-future' 'python-pyasn1')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('73be03b93027f8bd71ee66c6f724fb3ae32c92ec5ca1927fecb56edbb092a737')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-bloodhound
_pkgname=bloodhound
pkgver=1.1.1
pkgrel=2
pkgdesc="Python based ingestor for BloodHound, based on Impacket"
arch=('any')
url="https://github.com/fox-it/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython' 'python-future' 'python-pyasn1' 'python-future')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8e59f11942b5832a44ac85016fc7da1dd1e2fabbd0d8c221ce0227c6e862c5e3')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

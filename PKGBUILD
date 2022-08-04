# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-bloodhound
_pkgname=bloodhound
pkgver=1.4.0
pkgrel=1
pkgdesc="Python based ingestor for BloodHound, based on Impacket"
arch=('any')
url="https://github.com/fox-it/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython' 'python-future' 'python-pyasn1')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('609389fcbd0dbf37f56b3e282ee8f584b51c7bbd5235833d9dcd76d476bb591c')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

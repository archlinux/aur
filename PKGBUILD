# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-bloodhound
_pkgname=bloodhound
pkgver=1.0.5
pkgrel=1
pkgdesc="Python based ingestor for BloodHound, based on Impacket"
arch=('any')
url="https://github.com/fox-it/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('09bcfe9f7aea2d3ee57377b1edaa18a269140aba3b06c3fd7d8ba5a41b26786d')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

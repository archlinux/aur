# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python2-snmp-passpersist
_dlpkgname=snmp_passpersist
pkgver=1.3.0
pkgrel=1
pkgdesc="This module is a SNMP passpersist backend for Net-SNMP."
arch=(any)
url="https://pypi.python.org/pypi/snmp-passpersist"
license=('GPLv3')
depends=('python2>=2.6' 'net-snmp')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/s/snmp-passpersist/${_dlpkgname}-${pkgver}.tar.gz")
md5sums=('8680ea404d2fbe906b06256a2acf0ccb')

package() {
  cd ${srcdir}/${_dlpkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

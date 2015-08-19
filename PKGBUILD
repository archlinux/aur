# Maintainer: Robert Orzanna <orschiro at gmail dot com>
# Maintainer: Artem Klevtsov <a.a.klevtsov at gmail dot com>

pkgname=python2-iptcinfo
pkgver=1.9.5
pkgrel=6
pkgdesc=" extract and modify IPTC (metadata) information on images"
arch=('any')
url="https://pypi.python.org/pypi/IPTCInfo/"
license=('GPL')
depends=("python2")
source=("https://pypi.python.org/packages/source/I/IPTCInfo/IPTCInfo-${pkgver}-${pkgrel}.tar.gz")
md5sums=('62976f0228efa517298dd6dc7669e56e')

package() {
  cd "${srcdir}/IPTCInfo-${pkgver}-${pkgrel}"
  python2 setup.py install --root="${pkgdir}"
} 

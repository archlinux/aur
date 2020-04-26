# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_pkgname=KeePass
_lname=Finnish
_lcode=fi
pkgname=${_pkgname,,}-${_lcode}
pkgver=2.43
pkgrel=1
pkgdesc="${_lname} locale for ${_pkgname}"
arch=(any)
license=('GPL2')
depends=("${_pkgname,,}>=${pkgver}")
provides=("${pkgname}=${pkgver}")
url='https://keepass.info/translations.html'
source=("https://downloads.sourceforge.net/${_pkgname,,}/${_pkgname}-${pkgver}-${_lname}.zip")
sha256sums=('d84f19819f2bf682d604d500ce63d6601529680ddc3b0fb78ec2f54a21461fe6')

package(){
  install -Dm644 ${_lname}.lngx ${pkgdir}/usr/share/${_pkgname,,}/Languages/${_lname}.lngx
}

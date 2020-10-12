# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_pkgname=KeePass
_lname=Finnish
_lcode=fi
pkgname=${_pkgname,,}-${_lcode}
pkgver=2.46
pkgrel=1
pkgdesc="${_lname} locale for ${_pkgname}"
arch=(any)
license=('GPL2')
depends=("${_pkgname,,}>=${pkgver}")
provides=("${pkgname}=${pkgver}")
url='https://keepass.info/translations.html'
source=("https://downloads.sourceforge.net/${_pkgname,,}/${_pkgname}-${pkgver}-${_lname}.zip")
sha256sums=('32f02f43b0b840da604f57ed5985e0bc2ccf1f511b1a085f16ea2f95df36c98d')

package(){
  install -Dm644 ${_lname}.lngx ${pkgdir}/usr/share/${_pkgname,,}/Languages/${_lname}.lngx
}

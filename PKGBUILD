# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_pkgname=KeePass
_lname=Finnish
_lcode=fi
pkgname=${_pkgname,,}-${_lcode}
pkgver=2.40
pkgrel=2
pkgdesc="${_lname} locale for ${_pkgname}"
arch=(any)
license=('GPL2')
depends=("${_pkgname,,}>=${pkgver}")
provides=("${pkgname}=${pkgver}")
url='https://keepass.info/translations.html'
source=("https://downloads.sourceforge.net/${_pkgname,,}/${_pkgname}-${pkgver}-${_lname}.zip")
sha256sums=('b7de2f54afc6baeac621b08be0dfe079145c71730452a966eb64ff1a88c7bdcb')

package(){
  install -Dm644 ${_lname}.lngx ${pkgdir}/usr/share/${_pkgname,,}/Languages/${_lname}.lngx
}

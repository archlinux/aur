# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_pkgname=KeePass
_lname=Finnish
_lcode=fi
pkgname=${_pkgname,,}-${_lcode}
pkgver=2.42
pkgrel=1
pkgdesc="${_lname} locale for ${_pkgname}"
arch=(any)
license=('GPL2')
depends=("${_pkgname,,}>=${pkgver}")
provides=("${pkgname}=${pkgver}")
url='https://keepass.info/translations.html'
source=("https://downloads.sourceforge.net/${_pkgname,,}/${_pkgname}-${pkgver}-${_lname}.zip")
sha256sums=('547f918e8abfefb8ba46d9a4e32b6e2268fe3f984b82c0e8caded8cd9ec49579')

package(){
  install -Dm644 ${_lname}.lngx ${pkgdir}/usr/share/${_pkgname,,}/Languages/${_lname}.lngx
}

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-berzerkpt
_pkgname=berzerkpt
_pkgauthor=carlos_rupp
pkgver=1.0.2
_cdbrel=10305
pkgrel=1
pkgdesc="Action game in ancient Egypt."
license=("MIT")
sha256sums=('3ae71801491ab5a493af7a8497f2372a1b1c9f4063b2ebf504856b35c002cf98')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}

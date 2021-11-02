# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-hades-revisited
_pkgname=hades_revisited
_pkgauthor=Wuzzy
pkgver=0.14.0
_cdbrel=9602
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
license=("LGPL2.1")
sha256sums=('ea5621fc7e153075f1aa5a151a8b8842e8e3422ba73c87e68516d8c569ad5244')

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

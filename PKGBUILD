# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-whynot
_pkgname=whynot_game
_pkgauthor=bell07
pkgver=2022.01.20
_cdbrel=10723
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together "
license=("GPLv3")
sha256sums=('56e218d62f8806c02ab44cdc492586a2ea4d9e1cb6d22ce31ca1c39ec61e1243')

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

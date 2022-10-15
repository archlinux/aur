# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-whynot
_pkgname=whynot_game
_pkgauthor=bell07
pkgver=2022.04.20
_cdbrel=11899
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together "
license=("GPLv3")
sha256sums=('5d7eb997bfc3f649972071044db123b4f6f626210f4ae770d95b242e9399ea7b')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}

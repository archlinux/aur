# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-whynot
_pkgname=whynot_game
_pkgauthor=bell07
pkgver=2022.01.07
_cdbrel=10572
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together "
license=("GPLv3")
sha256sums=('df9ef612e19c91724e98f61af2e1319ad93d3dbeb303fd4129b5cc7e498ead49')

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

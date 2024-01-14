# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-whynot
_pkgname=whynot_game
_pkgauthor=bell07
pkgver=2023.12.22
_cdbrel=22529
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together "
license=("GPLv3")
sha256sums=('0cfae9a7433f73371f547aecd9c8dfce2894334775ee5cc5ec1eacce0e5b2f7c')

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

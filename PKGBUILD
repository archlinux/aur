# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-water-game
_pkgname=water_game
_pkgauthor=Lefty
pkgver=8455
_cdbrel=8455
pkgrel=1
pkgdesc="A WIP game of underwater exploration and survival. "
license=("GPLv3")
sha256sums=('c8dd8b7aaa79166e18cac5e527533f5a7fef6adcfc22b45e4dca66f1980eb135')

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

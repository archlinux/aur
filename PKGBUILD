# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-build-n-buy
_pkgname=build_n_buy
_pkgauthor=j45
pkgver=2022.08.16
_cdbrel=13312
pkgrel=1
pkgdesc="A game inspired by Minecraft Championship's Build Mart, where you have to replicate mini build and to get the materials for them, you have to go 'shopping'."
license=("MIT")
sha256sums=('5402fb3b20ffc27475a71e99697235677699c2d914f71cab791a880818a324e0')

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

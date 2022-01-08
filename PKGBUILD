# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-build-n-buy
_pkgname=build_n_buy
_pkgauthor=j45
pkgver=1.2.3
_cdbrel=10444
pkgrel=1
pkgdesc="A game inspired by Minecraft Championship's Build Mart, where you have to replicate mini build and to get the materials for them, you have to go 'shopping'."
license=("MIT")
sha256sums=('470dc134d7b68ee3f7d11ddacb256edfe0ae9310ee454f0e25c91831279d8e23')

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

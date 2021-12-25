# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-build-n-buy
_pkgname=build_n_buy
_pkgauthor=j45
pkgver=1.1
_cdbrel=10196
pkgrel=1
pkgdesc="A game inspired by Minecraft Championship's Build Mart, where you have to replicate mini build and to get the materials for them, you have to go 'shopping'."
license=("MIT")
sha256sums=('6cd5adb31d4d07ba921759dfd0c302f2103c7d0185dccb8d8d020e45369c900d')

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

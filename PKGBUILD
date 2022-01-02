# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-build-n-buy
_pkgname=build_n_buy
_pkgauthor=j45
pkgver=1.2.1
_cdbrel=10386
pkgrel=1
pkgdesc="A game inspired by Minecraft Championship's Build Mart, where you have to replicate mini build and to get the materials for them, you have to go 'shopping'."
license=("MIT")
sha256sums=('ead35d430278c08f288dc936194a6f58949fffc72a75f76569d4d468d7c0bf88')

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

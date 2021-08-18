# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinth
_pkgname=labyrinth
_pkgauthor=Just_Visiting
pkgver=0.9.3
_cdbrel=7979
pkgrel=1
pkgdesc="An aMAZEing Game"
license=("MIT")
sha256sums=('f15718f49ce213d9986989bfa889686bcded178815ee8c71758d8845dc9ad83c')

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

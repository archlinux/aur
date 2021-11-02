# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinth
_pkgname=labyrinth
_pkgauthor=Just_Visiting
pkgver=0.9.4
_cdbrel=8994
pkgrel=1
pkgdesc="An aMAZEing Game"
license=("MIT")
sha256sums=('ac22640365f57ec1bd6fb316ca82e84dff450488854484a22b248293cf67adde')

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

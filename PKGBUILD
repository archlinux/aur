# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinth
_pkgname=labyrinth
_pkgauthor=Just_Visiting
pkgver=1.0.1
_cdbrel=16683
pkgrel=1
pkgdesc="An aMAZEing Game"
license=("MIT")
sha256sums=('e874be2df976a0c04a9bd64267f7e3f4d097d0926f919f111158a31cc5b2ef23')

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

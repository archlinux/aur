# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinth
_pkgname=labyrinth
_pkgauthor=Just_Visiting
pkgver=1.0.0
_cdbrel=9620
pkgrel=1
pkgdesc="An aMAZEing Game"
license=("MIT")
sha256sums=('70b547ab7031b74fe483aa7f7ff87d98d4c42496d146c35e30731dd1859e940a')

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

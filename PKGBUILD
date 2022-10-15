# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-tutorial
_pkgname=tutorial
_pkgauthor=Wuzzy
pkgver=3.3.0
_cdbrel=13032
pkgrel=1
pkgdesc="Learn how to play Minetest."
license=("GPLv2")
sha256sums=('a54b51bfad632d61127db728b4925fd800abe87094f3de9dda250f5dd0cedf5f')

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

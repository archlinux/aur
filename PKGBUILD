# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-prang
_pkgname=prang
_pkgauthor=luk3yx
pkgver=2022.05.23
_cdbrel=12345
pkgrel=1
pkgdesc="An unofficial port of PRANG!, a 2D arcade-style game. "
license=("MIT")
sha256sums=('328aab74ad7848b9c77653fa7189a2c40ca977ab054556548c26f96dedee4d16')

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

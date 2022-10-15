# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-jail-escape
_pkgname=jail_escape
_pkgauthor=StarNinjas
pkgver=2.3
_cdbrel=11625
pkgrel=1
pkgdesc="Escape the Jail! Don't get caught!"
license=("CC0")
sha256sums=('35bb33bb56e71e791a4310c78d8df9221d4680e20a810c177428d32b5b446534')

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

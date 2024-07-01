# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-regnum
_pkgname=regnum
_pkgauthor=1248
pkgver=3.6.6
_cdbrel=25435
pkgrel=1
pkgdesc="Fight monsters, collect XP, craft battleaxes, armor, guns and lots more."
license=("LGPLv2.1")
sha256sums=('17f10cee41f9f0e93e8a8b22e9917d6706740d817e368910ee8e763b8fae88d6')

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

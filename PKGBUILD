# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-voxel-dungeon
_pkgname=voxeldungeon
_pkgauthor=Noodlemire
pkgver=1.6.1
_cdbrel=9212
pkgrel=1
pkgdesc="This is a recreation and adaptation of an Android rogue-like game, Pixel Dungeon by Watabou. "
license=("GPLv3")
sha256sums=('f40319b6db064d046ac19f2c48cd1be12d7b6cb53d473711ae364b84b9168fe7')

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

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-voxel-dungeon
_pkgname=voxeldungeon
_pkgauthor=Noodlemire
pkgver=1.6.0
_cdbrel=5023
pkgrel=1
pkgdesc="This is a recreation and adaptation of an Android rogue-like game, Pixel Dungeon by Watabou. "
license=("GPLv3")
sha256sums=('1a3b6e01a13fc8b7f57e5d79e17884d6bdee399272ed3653175652135d8b5840')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}

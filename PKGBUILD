# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-voxel-knights
_pkgname=voxel_knights
_pkgauthor=Lone_Wolf
pkgver=0.1.6
_cdbrel=20958
pkgrel=1
pkgdesc="WIP Medival Fantasy Open World PvE game"
license=("MIT")
sha256sums=('500ad56e9e214d1921a6df83387db6b94b20b4b6036a887b5f19a063ac0d96df')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}

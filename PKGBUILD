# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-voxel-knights
_pkgname=voxel_knights
_pkgauthor=Lone_Wolf
pkgver=0.1.5
_cdbrel=5110
pkgrel=1
pkgdesc="WIP Medival Fantasy Open World PvE game"
license=("MIT")
sha256sums=('58a13c3e6a570064a0e4fac50dfc0f20c9ca922556b0214c61945967ffcb383b')

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

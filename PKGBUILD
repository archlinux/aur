# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-arcade3d
_pkgname=pacman
_pkgauthor=Thunder1035
pkgver=2022.04.26
_cdbrel=11982
pkgrel=1
pkgdesc="A Pacman inspired game"
license=("GPLv3")
sha256sums=('83b6a4c76abeebcdf2e3ab2aef25d51406eaad27b52326e77a7df208a487d079')

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

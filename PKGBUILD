# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-prang
_pkgname=prang
_pkgauthor=luk3yx
pkgver=2022.10.09
_cdbrel=14264
pkgrel=1
pkgdesc="An unofficial port of PRANG!, a 2D arcade-style game. "
license=("MIT")
sha256sums=('36131ceaf3c11312103a9ca1cb7c2d443a343bd2df16cd37ee4f3d399e935495')

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

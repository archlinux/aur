# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-prang
_pkgname=prang
_pkgauthor=luk3yx
pkgver=2023.12.30
_cdbrel=22658
pkgrel=1
pkgdesc="An unofficial port of PRANG!, a 2D arcade-style game. "
license=("MIT")
sha256sums=('e29f1908e876df4476341d5bb830fcf99f75e151fa2c836b537e98a645f43abd')

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

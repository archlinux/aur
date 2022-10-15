# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-driftgame
_pkgname=driftgame
_pkgauthor=paramat
pkgver=2020.09.15
_cdbrel=6455
pkgrel=1
pkgdesc="Drive a car around procedurally generated roads"
license=("LGPLv2.1")
sha256sums=('8c9b63c8cd4030b305467ec9cd2a1240e5e9cfa4eba0576a0be81a903ddc53ed')

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

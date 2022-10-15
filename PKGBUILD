# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-newplanet
_pkgname=newplanet
_pkgauthor=Hi_World
pkgver=1.2.1
_cdbrel=4041
pkgrel=1
pkgdesc="You're on a strange planet, with 8 exciting biomes and a perpetual night, but beware, there are monsters ready to hunt you! "
license=("MIT")
sha256sums=('5d3415a8cfc5b314db602056d2f79353d35b50a136a705fc0a0297bee9333db1')

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

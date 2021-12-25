# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-solar-plains-invector
_pkgname=invector
_pkgauthor=Jordach
pkgver=10219
_cdbrel=10219
pkgrel=1
pkgdesc="A karting game with built in track editor"
license=("MIT")
sha256sums=('b466d7fca93e19233cd46523dd1ec61e37cb2915d7529fc929f588fb17b7f2ff')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}

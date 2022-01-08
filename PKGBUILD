# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-arcade3d
_pkgname=pacman
_pkgauthor=Thunder1035
pkgver=2022.01.06
_cdbrel=10482
pkgrel=1
pkgdesc="A Pacman inspired game"
license=("GPLv3")
sha256sums=('e085c7e16ca217cde0b08b11617eed9fdda1ca6c0445017c6e2fc287d14d01b1')

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

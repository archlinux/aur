# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-whynot
_pkgname=whynot_game
_pkgauthor=bell07
pkgver=2021.02.12
_cdbrel=6511
pkgrel=1
pkgdesc="Aims to get all existing high quality mods working together "
license=("GPLv3")
sha256sums=('e7fcd73aeae0d7becc43869d0b5555c3981ec5f79847390dd3eb5727deb7634d')

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

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nomansland
_pkgname=no_mans_land
_pkgauthor=Big_Caballito
pkgver=0.1.1
_cdbrel=8685
pkgrel=1
pkgdesc="Survive No Man's Land, where TNT rains from the sky, and destroys everything."
license=("GPLv3")
sha256sums=('7e6e4acddce66b09599e512355e8991975bdc817a8b8206cd0d2e56c105b02c4')

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

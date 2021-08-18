# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-dreambuilder
_pkgname=dreambuilder
_pkgauthor=VanessaE
pkgver=20210626.0349
_cdbrel=8225
pkgrel=1
pkgdesc="An attempt to give the player pretty much everything they could ever want to build with, and all the tools they should need to actually get the job done. "
license=("LGPLv3")
sha256sums=('1e5fde5b9fdebcdcd70de462ef822201c7e651c811f167460dff6f96707bced4')

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

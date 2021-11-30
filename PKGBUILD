# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-dreambuilder
_pkgname=dreambuilder
_pkgauthor=VanessaE
pkgver=20211128.1200
_cdbrel=9807
pkgrel=1
pkgdesc="An attempt to give the player pretty much everything they could ever want to build with, and all the tools they should need to actually get the job done. "
license=("LGPLv3")
sha256sums=('fe505dc932f7aec25106b8b995c0ea821f62285593939630402cf6ab3a8bcf02')

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

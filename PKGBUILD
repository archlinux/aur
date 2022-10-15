# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-dreambuilder
_pkgname=dreambuilder
_pkgauthor=VanessaE
pkgver=2022.10.15
_cdbrel=14371
pkgrel=1
pkgdesc="An attempt to give the player pretty much everything they could ever want to build with, and all the tools they should need to actually get the job done. "
license=("LGPLv3")
sha256sums=('44af1be87cfbf3e4f60cbca1071da809e02be5cc1d1e7f9d196a3f1a8acadc45')

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

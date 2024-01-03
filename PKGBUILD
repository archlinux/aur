# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-dreambuilder
_pkgname=dreambuilder
_pkgauthor=mt-mods
pkgver=2024.01.03
_cdbrel=22728
pkgrel=1
pkgdesc="An attempt to give the player pretty much everything they could ever want to build with, and all the tools they should need to actually get the job done. "
license=("LGPLv3")
sha256sums=('c0ccaaf58f58ed82748ada1c4bd0befec36a61db07ad319395988e162af7f215')

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

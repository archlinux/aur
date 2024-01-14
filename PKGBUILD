# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-driftgame
_pkgname=driftgame
_pkgauthor=mt-mods
pkgver=2023.11.27
_cdbrel=21978
pkgrel=1
pkgdesc="Drive a car around procedurally generated roads"
license=("LGPLv2.1")
sha256sums=('aff448c5cf3ede7ff433bc561bf469301368561eb602356dcf58601a0040d5fe')

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

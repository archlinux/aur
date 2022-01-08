# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-moontest
_pkgname=moontest
_pkgauthor=Droog71
pkgver=1.0.3
_cdbrel=10501
pkgrel=1
pkgdesc="Moon Habitat Simulator"
license=("AGPLv3")
sha256sums=('89b45cb9b705cf3c336ec499432d4e228761b7499e2064639e0c423d2a7e55e9')

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

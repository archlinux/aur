# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-moontest
_pkgname=moontest
_pkgauthor=Droog71
pkgver=2023.08.27
_cdbrel=20514
pkgrel=1
pkgdesc="Moon Habitat Simulator"
license=("AGPLv3")
sha256sums=('1b294ae1207dcbca83b78fad88ed946d5313f30412d108378e4e07f5c5b7d876')

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

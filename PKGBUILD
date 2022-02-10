# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-moontest
_pkgname=moontest
_pkgauthor=Droog71
pkgver=2022.02.05
_cdbrel=11101
pkgrel=1
pkgdesc="Moon Habitat Simulator"
license=("AGPLv3")
sha256sums=('3277feda7417f5c94f12dda579863448d5ad78e5be3b78d498cf263555115226')

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

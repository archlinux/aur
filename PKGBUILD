# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-spmeter
_pkgname=spmeter
_pkgauthor=crabycowman123
pkgver=0.1.1
_cdbrel=10172
pkgrel=1
pkgdesc="game jam submission"
license=("AGPLv3")
sha256sums=('3c4ad26586279ffee5dd41e4593fed9a994815dd408c677b78ed667dd38bed30')

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

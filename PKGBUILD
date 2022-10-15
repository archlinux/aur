# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-spmeter
_pkgname=spmeter
_pkgauthor=crabycowman123
pkgver=0.1.2
_cdbrel=11007
pkgrel=1
pkgdesc="game jam submission"
license=("AGPLv3")
sha256sums=('20f63b1b02cb584ae89d07d156d2d126e3624f52a0de24130989b95ebbd88270')

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

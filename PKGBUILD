# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-subway-miner
_pkgname=subway_miner
_pkgauthor=AFCM
pkgver=1.4
_cdbrel=10568
pkgrel=1
pkgdesc="A Subway Surfer inspired game"
license=("GPLv3")
sha256sums=('e18655b5a876f2790ffa339cdcdd3b6c1d0961c63ec856fb67f854a7b26ce5a6')

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

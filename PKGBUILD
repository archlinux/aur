# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-subway-miner
_pkgname=subway_miner
_pkgauthor=AFCM
pkgver=1.3
_cdbrel=10146
pkgrel=1
pkgdesc="A Subway Surfer inspired game"
license=("GPLv3")
sha256sums=('355116145c382cffd29ee8fec9df791e488362ff220a66349310bbab642f14c4')

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

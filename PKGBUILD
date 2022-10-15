# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-subway-miner
_pkgname=subway_miner
_pkgauthor=AFCM
pkgver=1.6
_cdbrel=10900
pkgrel=1
pkgdesc="A Subway Surfer inspired game"
license=("GPLv3")
sha256sums=('7ffd3626e8746b54b6bdbc83e9c4c6999ebe419ceafce5c18593717eb5643454')

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

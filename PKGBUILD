# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-farlands-reloaded
_pkgname=farlands_reloaded
_pkgauthor=wsor4035
pkgver=2022.03.27
_cdbrel=11666
pkgrel=1
pkgdesc="a game" # tfw
license=("MIT")
sha256sums=('ebdacfe84515997bc0d868528ca1343ee77ebdf720a40b1cb5bc7ece728d1b7c')

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

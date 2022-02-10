# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-farlands-reloaded
_pkgname=farlands_reloaded
_pkgauthor=wsor4035
pkgver=2022.01.18
_cdbrel=10683
pkgrel=1
pkgdesc="a game" # tfw
license=("MIT")
sha256sums=('b8664c367e953125d3655f04b50456ae5d4b32201501054a80b1d79984810ab1')

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

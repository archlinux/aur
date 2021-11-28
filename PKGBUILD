# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-farlands-reloaded
_pkgname=farlands_reloaded
_pkgauthor=wsor4035
pkgver=2021.11.26
_cdbrel=9772
pkgrel=1
pkgdesc="a game" # tfw
license=("MIT")
sha256sums=('8d5768c96c47039e43c45971fd595412a249562e219e3542cf9f382f7df8f62e')

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

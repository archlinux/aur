# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-farlands-reloaded
_pkgname=farlands_reloaded
_pkgauthor=wsor4035
pkgver=2023.12.13
_cdbrel=22317
pkgrel=1
pkgdesc="a game" # tfw
license=("MIT")
sha256sums=('9847ece8814df7d00e0b1db3c10b7dc768c79390cacf08be5d9d62ae0fdea96c')

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

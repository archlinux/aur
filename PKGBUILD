# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lazarr
_pkgname=lazarr
_pkgauthor=Wuzzy
pkgver=1.3.2
_cdbrel=12770
pkgrel=1
pkgdesc="Laser puzzle game"
license=("GPLv3")
sha256sums=('5925a044e9b4420a1d70d7cdcd7a796dee8d97c865ec4eb52233a77759af6d8a')

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

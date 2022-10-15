# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinthus
_pkgname=labyrinthus
_pkgauthor=1248
pkgver=2.10.1
_cdbrel=12203
pkgrel=1
pkgdesc="Can you help the nyancat to find her rainbow block??"
license=("LGPLv2.1")
sha256sums=('9b306158ba074f64b67398db7794c1ee5d5a748313115605838ea5e0545c90a0')

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

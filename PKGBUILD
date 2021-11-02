# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinthus
_pkgname=labyrinthus
_pkgauthor=1248
pkgver=2.9.0
_cdbrel=9332
pkgrel=1
pkgdesc="Can you help the nyancat to find her rainbow block??"
license=("LGPLv2.1")
sha256sums=('e4529b4d4fb9e8aadfd7f8ba1f40a8ed44165d33b5a4a2bc9405ecc8ef1d82a7')

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

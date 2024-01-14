# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-labyrinthus
_pkgname=labyrinthus
_pkgauthor=1248
pkgver=2.13.0
_cdbrel=21443
pkgrel=1
pkgdesc="Can you help the nyancat to find her rainbow block??"
license=("LGPLv2.1")
sha256sums=('a69c3f06887b11a7d60f27959a17769f2bbf5d6606a3a3e715962ccda85e191f')

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

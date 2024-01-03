# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-blockbomber
_pkgname=blockbomber
_pkgauthor=MisterE
pkgver=2023.12.1
_cdbrel=22276
pkgrel=1
pkgdesc="Battle your friends for power-ups and be the last blocker standing! A Multiplayer Bomberman clone."
license=("LGPLv3")
sha256sums=('26d72e17ba241877b312f307fc7d4a70b7296a493ecac768188203a69d6b7e37')

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

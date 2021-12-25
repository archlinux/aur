# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-parkour
_pkgname=parkour
_pkgauthor=Emojiminetest
pkgver=10197
_cdbrel=10197
pkgrel=1
pkgdesc="Parkour game!"
license=("LGPLv2.1")
sha256sums=('7b8843be82ed5fb90d5e39d9ea411034f6219d069c5169ab79fa48ee767039c0')

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

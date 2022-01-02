# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-easytest
_pkgname=ksurvive # technical name, not typo
_pkgauthor=mooD_Slayer # internal username, not typo
pkgver=0.0.7
_cdbrel=10346
pkgrel=1
pkgdesc="A game that changes much of MTG's gameplay and adds new features. "
license=("LGPLv2.1")
sha256sums=('adcb7d611b6ec8cc29a8cb4df5217df396aa47e5da64adb26ac8d9bcfe7071e8')

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

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-easytest
_pkgname=ksurvive # technical name, not typo
_pkgauthor=mooD_Slayer # internal username, not typo
pkgver=0.0.4
_cdbrel=8713
pkgrel=1
pkgdesc="A game that changes much of MTG's gameplay and adds new features. "
license=("LGPLv2.1")
sha256sums=('db97dbedce52dbcf840f11972f206b238dd2897bb67fa041c8e7d7a410980ef5')

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

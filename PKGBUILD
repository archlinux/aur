# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-regnum
_pkgname=regnum
_pkgauthor=1248
pkgver=3.6.1
_cdbrel=8411
pkgrel=1
pkgdesc="Fight monsters, collect XP, craft battleaxes, armor, guns and lots more."
license=("LGPLv2.1")
sha256sums=('2716a04283a95962fb767a1d000a4a15bda2fabc06fc4c3422994a267bf5a309')

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

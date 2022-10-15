# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-regnum
_pkgname=regnum
_pkgauthor=1248
pkgver=3.6.2
_cdbrel=12150
pkgrel=1
pkgdesc="Fight monsters, collect XP, craft battleaxes, armor, guns and lots more."
license=("LGPLv2.1")
sha256sums=('59f99e93274489aee6937caa46e6ba26bf632232bfc58b5337f3dcf114d730ed')

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

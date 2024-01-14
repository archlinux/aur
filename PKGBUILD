# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-regnum
_pkgname=regnum
_pkgauthor=1248
pkgver=3.6.5
_cdbrel=22677
pkgrel=1
pkgdesc="Fight monsters, collect XP, craft battleaxes, armor, guns and lots more."
license=("LGPLv2.1")
sha256sums=('64ea5d1e782200f353e6ac22af34186ed58ffd01a2dc0a71bfdfe1d552ade5b8')

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

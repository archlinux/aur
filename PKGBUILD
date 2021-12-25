# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-stella
_pkgname=stella
_pkgauthor=1248
pkgver=1.0.0
_cdbrel=10125
pkgrel=1
pkgdesc="You start on a small island and your goal is to enlarge it."
license=("LGPLv2.1")
sha256sums=('ca1aaa618e4f3572c602e4ff3043324c20061894117b20bdcc6d77288c7c9b3a')

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

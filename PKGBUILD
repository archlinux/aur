# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-berzerkpt
_pkgname=berzerkpt
_pkgauthor=carlos_rupp
pkgver=1.0.1
_cdbrel=10248
pkgrel=1
pkgdesc="Action game in ancient Egypt."
license=("MIT")
sha256sums=('b7c529b687c258b3d6ccec82e462e900c8af022f996eb084b15a83b9a2df0c2c')

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

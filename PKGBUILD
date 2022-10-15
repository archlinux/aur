# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-parkour
_pkgname=parkour
_pkgauthor=Emojiminetest
pkgver=11037
_cdbrel=11037
pkgrel=1
pkgdesc="Parkour game!"
license=("LGPLv2.1")
sha256sums=('167dfc3aa54379af28ee9aeeaf6514f13a7aa91f0733bbf2370d48eed44d70e0')

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

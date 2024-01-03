# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-alter
_pkgname=alter
_pkgauthor=yaman
pkgver=2023.01.09
_cdbrel=16458
pkgrel=1
pkgdesc="A challenging puzzle game in a dystopian future."
license=("AGPLv3")
sha256sums=('aee9465179bdc7ccbffd94a4dd9585d339afb66f04747e9a21d065304fa47ede')

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

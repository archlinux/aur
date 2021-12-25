# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-alter
_pkgname=alter
_pkgauthor=yaman
pkgver=0.1.2
_cdbrel=10148
pkgrel=1
pkgdesc="A challenging puzzle game in a dystopian future."
license=("AGPLv3")
sha256sums=('a8b1c39a896f6e7ab92d79b5ce6d44c631211ee9e35c4fdecd0112bc599fd380')

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

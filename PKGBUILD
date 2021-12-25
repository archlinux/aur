# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-coconut-collection
_pkgname=coconut_collection
_pkgauthor=MCL
pkgver=1.0.0
_cdbrel=10193
pkgrel=1
pkgdesc="A game heavily inspired by ""Coconut Hut"" for the Ouya."
license=("GPLv2")
sha256sums=('17cfd26515c63f093761a468af565f9eff3684c60dee1bf45e38f223bcdf154e')

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

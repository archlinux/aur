# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-little-lady
_pkgname=littlelady
_pkgauthor=Just_Visiting
pkgver=10980
_cdbrel=10980
pkgrel=1
pkgdesc="A Little Ladybug in a Big World"
license=("MIT")
sha256sums=('5cefbe5084523a8a338495bafabbfb18fb2b3490e6873a3674b89186f4971cfc')

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

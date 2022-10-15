# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minetest-extended
_pkgname=minetest_extended
_pkgauthor=PetiAPocok
pkgver=1.2
_cdbrel=7305
pkgrel=1
pkgdesc="The extended version of the default Minetest Game."
license=("LGPLv2.1")
sha256sums=('4abcab682dba8b86ad31eec716222eff4f73603a98e1cfea89767ee2ad278c61')

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

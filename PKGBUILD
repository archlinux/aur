# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-hades-revisited
_pkgname=hades_revisited
_pkgauthor=Wuzzy
pkgver=0.14.2
_cdbrel=9850
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
license=("LGPL2.1")
sha256sums=('ba3267809413edf44e3eaba0807e58e975816a94bd67ab6ecec23aabc72a58d2')

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

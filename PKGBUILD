# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-moontest
_pkgname=moontest
_pkgauthor=Droog71
pkgver=2021.12.22
_cdbrel=10180
pkgrel=1
pkgdesc="Moon Habitat Simulator"
license=("AGPLv3")
sha256sums=('6a161f1683790d9ba3baa154b380baf45647f77475cf53f715fe46b7e61335fc')

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

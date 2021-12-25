# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-modular-portals
_pkgname=modular_portals
_pkgauthor=UnbrokenUnworn
pkgver=10101
_cdbrel=10101
pkgrel=1
pkgdesc="Explore a strange hall filled with portals"
license=("AGPLv3")
sha256sums=('8f76e2f76b93d43615080ab5b763aeff698f8ebf71eb578982eef162d999a80d')

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

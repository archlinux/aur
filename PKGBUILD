# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-tutorial
_pkgname=tutorial
_pkgauthor=Wuzzy
pkgver=3.1.1
_cdbrel=6785
pkgrel=1
pkgdesc="Learn how to play Minetest."
license=("GPLv2")
sha256sums=('ff4ede8cd9d820bade6adf10f2404f15b3e847497dfb995ad48a43021f90c179')

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

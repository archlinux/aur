# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodeverse
_pkgname=nodeverse
_pkgauthor=aerkiaga
pkgver=0.1.7
_cdbrel=11000
pkgrel=1
pkgdesc="A procedurally generated space exploration game"
license=("GPLv3")
sha256sums=('fe7f4fee439dfdf4fab06e3259dc50308e5fdcdb32afea676859bf52351dfc53')

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

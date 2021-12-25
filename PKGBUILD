# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-balloonair
_pkgname=balloonair
_pkgauthor=NO11
pkgver=1.0.0
_cdbrel=10150
pkgrel=1
pkgdesc="A hot air balloon game created for the 2021 Minetest GAME JAM."
license=("GPLv3")
sha256sums=('0baf7a142884f181db87d87a7eec7c0daeccbf21467e2ffc2bfd0a8b928dc3af')

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

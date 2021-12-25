# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-grand-theft-box
_pkgname=grand_theft_box
_pkgauthor=jamiebearcub
pkgver=10176
_cdbrel=10176
pkgrel=1
pkgdesc="Grand Theft Box!"
license=("LGPLv2.1")
sha256sums=('3725ec840215b7955e4652c28fe497d54c31ab66d51fc5cd4340f77bb158d526')

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

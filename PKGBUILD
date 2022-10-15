# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-realtest
_pkgname=realtest_mt5
_pkgauthor=Wuzzy
pkgver=1.2.2
_cdbrel=7919
pkgrel=1
pkgdesc="Open-ended sandbox survival game focused on realism "
license=("GPLv3")
sha256sums=('cf7d2b70bca81a34dab022ec052cca323d217952a182dc54e4712406f6a18f11')

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

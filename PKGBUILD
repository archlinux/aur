# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodeverse
_pkgname=nodeverse
_pkgauthor=aerkiaga
pkgver=0.1.6
_cdbrel=10492
pkgrel=1
pkgdesc="A procedurally generated space exploration game"
license=("GPLv3")
sha256sums=('acbdac76447d5ff713648027b6fd5e716e8effb81002430d43cc1a3fd700f598')

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

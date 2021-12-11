# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-juanchi-game
_pkgname=juanchi
_pkgauthor=runs
pkgver=4.7.1
_cdbrel=9936
pkgrel=1
pkgdesc="A game just for fun with blocks, animals and a lot of more. "
license=("AGPLv3")
sha256sums=('0c5425c5c138afb30136f77530c1c27b15c0e2ab157921cff9e15a9adb63252a')

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

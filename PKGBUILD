# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minekart
_pkgname=minekart
_pkgauthor=wsor4035
pkgver=2021.10.11
_cdbrel=9477
pkgrel=1
pkgdesc="Racing game, with procedurally generated tracks"
license=("MIT")
sha256sums=('bccca22d360f516d72310bbb4e257dd0f311618907cf0b3aab33a0fa517e833f')

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

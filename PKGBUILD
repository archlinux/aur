# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-blockbomber
_pkgname=blockbomber
_pkgauthor=MisterE
pkgver=2022.01.13
_cdbrel=10599
pkgrel=1
pkgdesc="Battle your friends for power-ups and be the last blocker standing! A Multiplayer Bomberman clone."
license=("LGPLv3")
sha256sums=('25ca51e92e4121d020895bc1070f787aed31296012d58d0181e30068aa728edb')

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

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-blockbomber
_pkgname=blockbomber
_pkgauthor=MisterE
pkgver=2021.12.22
_cdbrel=10182
pkgrel=1
pkgdesc="Battle your friends for power-ups and be the last blocker standing! A Multiplayer Bomberman clone."
license=("LGPLv3")
sha256sums=('5b08c1e25442ab5535052683d61a1b458e678f0f1153a6e9a3262b0f0c280298')

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

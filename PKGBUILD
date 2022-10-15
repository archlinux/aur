# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-blockbomber
_pkgname=blockbomber
_pkgauthor=MisterE
pkgver=2022.03.15
_cdbrel=11576
pkgrel=1
pkgdesc="Battle your friends for power-ups and be the last blocker standing! A Multiplayer Bomberman clone."
license=("LGPLv3")
sha256sums=('f8ef15b5c46702a9c227c4bcf60031129ec984b0c9e5bbd0d252fc8987e7db64')

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

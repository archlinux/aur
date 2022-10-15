# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-openblox
_pkgname=openblox
_pkgauthor=ROllerozxa
pkgver=2021.08.17
_cdbrel=8955
pkgrel=1
pkgdesc="Roblox-inspired game. (Work in progress!)"
license=("GPLv3")
sha256sums=('a0a7048d454ccf05f03af5ae3937a0d9893706aa87a26a7f80b1b3d45730de82')

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

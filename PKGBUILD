# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-arcade3d
_pkgname=pacman
_pkgauthor=Thunder1035
pkgver=2021.12.21
_cdbrel=10132
pkgrel=1
pkgdesc="A Pacman inspired game"
license=("GPLv3")
sha256sums=('a4cc81436196b14c98b61668295462d2737ee046157a0597b3b1c87fbd2fd663')

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

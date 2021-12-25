# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-towerdefense
_pkgname=lexa
_pkgauthor=Aurailus
pkgver=0.0.4
_cdbrel=10216
pkgrel=1
pkgdesc="WIP Tower Defense Game"
license=("CC-BY-4.0")
sha256sums=('de9c60fc83ef1a11425e3c909ecad395f1797654e42c16070c2b1b07b00bcbf4')

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

# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-subway-miner
_pkgname=subway_miner
_pkgauthor=AFCM
pkgver=1.7
_cdbrel=24722
pkgrel=1
pkgdesc="A Subway Surfer inspired game"
license=("GPLv3")
sha256sums=('dff44d4be883a9c813f848ff151fe25753fdaa0c3a8d8ef5326e874e3f814ea4')

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

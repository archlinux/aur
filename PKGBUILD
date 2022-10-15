# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-hades-revisited
_pkgname=hades_revisited
_pkgauthor=Wuzzy
pkgver=0.15.2
_cdbrel=12964
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
license=("LGPL2.1")
sha256sums=('b074531d67a56497745cc02695fe72b4142946ca615039b39397838abff9f4a3')

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

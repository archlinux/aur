# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodecore
_pkgname=nodecore
_pkgauthor=Warr1024
pkgver=03109024
_cdbrel=27693
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
license=("MIT")
sha256sums=('6a3c965852c5f5e3e6fde89794dda417066d9f1bc48828f187b6b2ec73242275')

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

# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-mod-awards
pkgver=3.4.0
pkgrel=1
pkgdesc="Adds awards to Minetest, and an API to register new ones."
arch=("any")
url="https://content.minetest.net/packages/rubenwardy/awards/"
license=("MIT")
depends=("minetest-common")
source=("awards-${pkgver}.zip::https://gitlab.com/rubenwardy/awards/-/archive/v${pkgver}/awards-v${pkgver}.zip")
sha256sums=('6ef26c8465715e2ca42b49debe5deda1adb50d8648b997226e114e04145f8776')
options=(!strip)

package() {
	install -d "${pkgdir}/usr/share/minetest/mods/awards"
	cp -r "${srcdir}/awards-v${pkgver}/"* "${pkgdir}/usr/share/minetest/mods/awards"
}

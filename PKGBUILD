# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-mod-worldedit
pkgver=1.3
pkgrel=1
pkgdesc="The ultimate in-game world editing tool for Minetest!"
arch=("any")
url="https://content.minetest.net/packages/sfan5/worldedit/"
license=("AGPLv3")
depends=("minetest-common")
source=("worldedit-${pkgver}.zip::https://github.com/Uberi/Minetest-WorldEdit/archive/refs/tags/${pkgver}.zip")
sha256sums=('534565ac33b79278960430ace4650b82b248aa8116ab046e4305398d81654bf2')
options=(!strip)

package() {
	install -d "${pkgdir}/usr/share/minetest/mods/worldedit"
	cp -r "${srcdir}/Minetest-WorldEdit-${pkgver}/"* "${pkgdir}/usr/share/minetest/mods/worldedit"
}

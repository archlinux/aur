# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-mod-basic-materials
pkgver=2021.01.30
_pkgver=2021-01-30
pkgrel=1
pkgdesc="Provides a small selection of \"basic\" materials and items that other mods should use when possible."
arch=("any")
url="https://content.minetest.net/packages/VanessaE/basic_materials/"
license=("LGPLv3")
depends=("minetest-common")
source=("basic_materials-${_pkgver}.zip::https://gitlab.com/VanessaE/basic_materials/-/archive/${_pkgver}/basic_materials-${_pkgver}.zip")
sha256sums=('9fec9690f69f9b6936b78bed242fbf518332ed75741a864d9c297e0ce71a36e8')
options=(!strip)

package() {
	install -d "${pkgdir}/usr/share/minetest/mods/basic_materials"
	cp -r "${srcdir}/basic_materials-${_pkgver}/"* "${pkgdir}/usr/share/minetest/mods/basic_materials"
}

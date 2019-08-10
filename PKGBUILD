# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Hobbes

pkgname=openxcom-mod-area51
pkgver=0.972
pkgrel=3
pkgdesc="Area 51 - a mod for OpenXcom"
url="https://openxcom.mod.io/area-51"
license=('GPLv3')
source=("https://binary.mod.io/mods/58a2/192/area_51_v${pkgver}.zip")
sha512sums=('803acd9d49a5d069f9100cc77e31c7e55bf8800c69966c95fe85cc732d78fa573e98f94f75829d64f7a1fa4f1ef11bf67213057354c608990e1fa31c04856f23')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="Area 51"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream} v${pkgver}"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard/Area51"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Dioxine

pkgname=openxcom-mod-xpiratez
pkgver=j15
_pkgver_upstream="J15 11-Jun-2019"
pkgrel=1
pkgdesc="X-Piratez - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/x-piratez"
license=('GPLv3')
source=("https://binary.mod.io/mods/077e/249/dioxine_xpiratez_${pkgver}.zip")
sha512sums=('ff752c8956472ebea909ee99121b0883f2935943af21ba8d63e5dd5856597f520bd13d01a130ddeff84d20247e758072cd66aa97a2d3653457d81d661dc62c83')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="Dioxine_XPiratez"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream}/user/mods"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


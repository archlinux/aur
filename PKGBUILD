# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Hobbes

pkgname=openxcom-mod-area51
pkgver=0.972
pkgrel=2
pkgdesc="Area 51 - a mod for OpenXcom"
url="https://openxcom.mod.io/area-51"
license=('GPLv3')
source=("https://binary.mod.io/mods/58a2/192/area_51_v${pkgver}.zip")
sha512sums=('b686927caa03b9b429f4c19f2d8472dae1d0eb36a34b3b6dbdffda0379b18c4db41c1b4131f65f776429adc370cbbb94d99589b9b1fa427d6a91bda23fe51ba5')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="Area 51"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream} v${pkgver}"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard/Area51"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


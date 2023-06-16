# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Dioxine

pkgname=openxcom-mod-xpiratez
pkgver=l6
_pkgver_upstream="06-Dec-2020"
pkgrel=1
pkgdesc="X-Piratez - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/x-piratez"
license=('GPLv3')
source=("https://binary.mod.io/mods/077e/249/dioxine_xpiratez_${pkgver}.zip")
sha256sums=('f7e1955b76ae85e64418376ac545e2bbbb0603e623397d7317c3ca2adcdd70bc')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="Dioxine_XPiratez"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream}/user/mods"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


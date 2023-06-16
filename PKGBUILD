# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Nord

pkgname=openxcom-mod-twots
pkgver=2_56
pkgrel=1
pkgdesc="The World of Terrifying Silence - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/the-world-of-terrifying-silence"
license=('GPLv3')
source=("https://binary.mod.io/mods/8bf1/378/twots_${pkgver}.zip")
sha256sums=('96bea83c59f1916614d3542b386ae1ce6eea9ada435219c7264674c37f40602b')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="TWoTS"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream}"
    mkdir -p ${pkgdir}/usr/share/openxcom/standard
    cp -dr --no-preserve=ownership "${_mod_src}" $pkgdir/usr/share/openxcom/standard/
}


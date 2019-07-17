# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Nord

pkgname=openxcom-mod-twots
pkgver=2_31
pkgrel=2
pkgdesc="The World of Terrifying Silence - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/the-world-of-terrifying-silence"
license=('GPLv3')
source=("https://binary.mod.io/mods/8bf1/378/twots_${pkgver}.zip")
sha512sums=('48a03440a90abac415c667d8fa9987cfbf4cc50e1191f8e5712741f99e686646ca8cb9b3152a5d270b9fd107f06bbf3b18a15877df995123f65af8381b133f9a')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="TWoTS"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream} ${pkgver}/User/Mods/${_pkgname_upstream}"
    mkdir -p ${pkgdir}/usr/share/openxcom/standard
    cp -dr --no-preserve=ownership "${_mod_src}" $pkgdir/usr/share/openxcom/standard/
}


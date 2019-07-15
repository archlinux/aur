# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Hobbes

pkgname=openxcom-mod-area51
pkgver=0.972
pkgrel=1
pkgdesc="Area 51 - a mod for OpenXcom"
url="https://openxcom.mod.io/area-51"
license=('GPLv3')
source=("https://binary.mod.io/mods/58a2/192/area_51_v${pkgver}.zip")
sha512sums=('7af306c7c8f522d69d6c5eb8e86b51b4a2f0f3846d92f8e230aed724d64998c7478027df5b9efd244376b369f7dfa4060e60cc4b72682b86497aa9a3fc82ddd3')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="Area 51"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream} v${pkgver}"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard/Area51"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


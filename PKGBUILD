# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Solarius_Scorch

pkgname=openxcom-mod-xfiles
pkgver=2.9
pkgrel=1
pkgdesc="The X-Com Files - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/the-x-com-files"
license=('GPLv3')
source=("https://binary.mod.io/mods/0640/158/openxcom_xfiles_${pkgver}-9vuz.zip")
sha256sums=('a6795797f8bb8b3f9a9452208dfd2aa4896f02ea72c4ad395309bad81193a71e')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="OpenXcom_XFiles"

package() {
    _mod_src="${srcdir}/XComFiles"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


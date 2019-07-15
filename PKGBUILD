# Maintainer Robert Gonciarz <gonciarz(malpa)gmail.com>
# Upstream author: Solarius_Scorch

pkgname=openxcom-mod-xfiles
pkgver=0.9.9d
pkgrel=1
pkgdesc="The X-Com Files - a mod for OpenXcom (OXCE)"
url="https://openxcom.mod.io/the-x-com-files"
license=('GPLv3')
source=("https://binary.mod.io/mods/0640/158/openxcom_xfiles_${pkgver}.zip")
sha512sums=('0d2663177d4ac55171a4a9d709a4288934c3b198f5b60ddc79c337b1978acbf7aa7b2f160fb5b66e7e1669fe9ee6242a8dc2757e7a34c48c242b74e7946b70f9')
arch=('x86_64')
depends=('openxcom')

_pkgname_upstream="OpenXcom_XFiles"

package() {
    _mod_src="${srcdir}/${_pkgname_upstream}/user/mods"
    _mod_dest="${pkgdir}/usr/share/openxcom/standard"
    mkdir -p ${_mod_dest}
    cp -dr --no-preserve=ownership "${_mod_src}"/* ${_mod_dest} 
}


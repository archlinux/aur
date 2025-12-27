# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Skin author: amdpastrana

pkgver=1.2.9
pkgname=aimp-skin-m5
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="Inspired by AIMP SKIN and A4 from ELECTRON!CK"
arch=('any')
provides=('aimp-skin')
license=('custom')
depends=('aimp')
source=("${url}/files/windows/skins/m/M5.zip")
sha256sums=('cb915821175a0cdfdb6537e6fb336d2f8d85e606a00d8ed336b4ebd9904ebb27')

package(){
   DEST="${pkgdir}/opt/aimp/Skins"
   mkdir -p "${DEST}"
   cp "${srcdir}/M5.acs5" "${DEST}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
}


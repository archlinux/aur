# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Skin author: gr-e

pkgver=3.13.1
pkgname=aimp-skin-soot
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="Skin for AIMP"
arch=('x86_64')
provides=('aimp-skin')
license=('custom')
depends=('aimp')
source=("${url}/files/windows/skins/s/Soot.zip")
sha256sums=('0271f5f68eff550933ae29c0708ebb85f7d2e3ea53cf2d50aa8b47654e72e54d')

package(){
   DEST="${pkgdir}/opt/aimp/Skins"
   mkdir -p "${DEST}"
   cp "${srcdir}/Soot.acs5" "${DEST}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
}


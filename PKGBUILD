# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Skin author: gr-e

pkgver=4.0.1
pkgname=aimp-skin-soot
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="Skin for AIMP"
arch=('x86_64')
provides=('aimp-skin')
license=('custom')
depends=('aimp')
source=("${url}/files/desktop/skins/s/Soot.zip")
sha256sums=('675bead4376bf1cbc5a35d09c14100a7128295d25b82594016c5f6041f0d71ea')

package(){
   DEST="${pkgdir}/opt/aimp/Skins"
   mkdir -p "${DEST}"
   cp "${srcdir}/Soot.acs5" "${DEST}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
}


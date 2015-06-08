# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=tiling
pkgver=1.7.0
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="http://kde-look.org/content/show.php?content=161151"
license=('GPL')
depends=('kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/161151-${_pkgname}.kwinscript)
md5sums=('7f7a7865ee6e0235ca1aa83110aff112')

package() {
  install -d "${pkgdir}/usr/share/apps/kwin/scripts/kwin-script-tiling/"
  cp -r "${srcdir}"/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/apps/kwin/scripts/kwin-script-tiling/"
  install -Dm644 "${srcdir}/metadata.desktop" "${pkgdir}/usr/share/kde4/services/kwin-script-tiling.desktop"
}

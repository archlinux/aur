# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contirbutor: Christian Galander <galander.c at gmail dot com>

pkgname=plasma-theme-diamond
_pkgname="Diamond"
pkgver=2.0.3
pkgrel=1
pkgdesc="Transparent theme for KDE 4.x"
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php/Diamond?content=153930"
depends=('plasma-workspace')
source=("https://dl.opendesktop.org/api/files/download/id/1460732733/153930-${_pkgname}.tar.gz")
md5sums=('c47cd16b32ae486edb633da45ae66e71')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/plasma/desktoptheme"
  find "${pkgdir}/usr/share/plasma/desktoptheme" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/plasma/desktoptheme" -type f -exec chmod 644 {} \;
}

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
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/153930-${_pkgname}.zip")
md5sums=('e2f326c03b77c6ce1e8c8db0ad79ce7b')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/apps/desktoptheme"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/apps/desktoptheme"
  find "${pkgdir}/usr/share/apps/desktoptheme" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/apps/desktoptheme" -type f -exec chmod 644 {} \;
}

# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgname=kdm-theme-modernarchlinux
pkgver=1.0.3
pkgrel=2
pkgdesc="Simple and minimalist theme for KDM with Archlinux logo"
arch=('any')
url="http://kde-look.org/content/show.php?action=content&content=163475"
license=('GPLv3')
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/163475-KDM-Theme-archlinux.tar.gz")
md5sums=('c6c5e583476e85599fa07449b7b1b506')

package() {
  # install kdm theme
  install -dm755 "${pkgdir}/usr/share/apps/kdm/themes/modernarchlinux"
  install -m644 "${srcdir}/KDM-Theme-archlinux/"* -t "${pkgdir}/usr/share/apps/kdm/themes/modernarchlinux"
  rm "${pkgdir}/usr/share/apps/kdm/themes/modernarchlinux/Licence GPLv3"
}

# Maintainer: cippaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=kdeplasma-theme-amakage
pkgver=3.1.2
pkgrel=1
pkgdesc="Translucent theme for KDE 4. This will be the successor of Xenon"
arch=('any')
license=('CCPL')
url="http://kde-look.org/content/show.php/Amakage?content=150285"
depends=('kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/150285-Amakage.tar.xz)
sha1sums='56ff08123e3fdf55d40ff51e93b8ca4428741049'

package()
{
  install -d ${pkgdir}/usr/share/apps/desktoptheme
  cp -r ${srcdir}/Amakage ${pkgdir}/usr/share/apps/desktoptheme/
  for file in `find ${pkgdir}/usr/share/apps/desktoptheme/Amakage -type f ! -perm 644`; do chmod 644 $file; done
}

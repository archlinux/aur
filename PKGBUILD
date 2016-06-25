# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Put icons always in folder with version and release
pkgname=super-ultra-flat-numix-remix-icons
pkgver=4.2
pkgrel=3
pkgdesc="super-ultra-flat-numix-remix is an icon theme build upon 4 different icon sets - check github for more info"
arch=('any')
url="http://sourceforge.net/projects/super-ultra-flat-numix-remix"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
provides=('super-ultra-flat-numix-remix-icons')
options=(!strip !emptydirs)
source=("http://downloads.sourceforge.net/project/super-ultra-flat-numix-remix/super-ultra-flat-numix-remix-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('SKIP')

package() {

  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -r ${srcdir}/* ${pkgdir}/usr/share/icons/
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}

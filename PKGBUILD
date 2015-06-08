# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: apollokk <karanti@ontelecoms.gr>

pkgname=eleonora-plasmatheme
pkgver=1.1
pkgrel=1
pkgdesc="A new, Glassified and Aya based, plasma theme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kde-look.org/content/show.php/Eleonora?content=98341"
depends=('kdelibs' 'kdebase-workspace')
source=("Eleonora.tar.gz::http://kde-look.org/CONTENT/content-files/98341-Eleonora.tar.gz")
sha256sums=('8571e925478cfed8152c1b99b4bcd515b4c0741dea8a2ead0c182a62a070d8d3')

package() {
 install -dm755 ${pkgdir}/usr/share/apps/desktoptheme
 cp -r ${srcdir}/Eleonora ${pkgdir}/usr/share/apps/desktoptheme
 find "${pkgdir}/usr/share/apps/desktoptheme" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr/share/apps/desktoptheme" -type f -exec chmod 644 '{}' \;
}

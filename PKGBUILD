# Maintainer: Szymon Scholz
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: apollokk <karanti@ontelecoms.gr>

pkgname=eleonora-plasmatheme
pkgver=1.1
pkgrel=2
pkgdesc="A new, Glassified and Aya based, plasma theme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://web.archive.org/web/20150415080850/http://www.kde-look.org/content/show.php/Eleonora?content=98341"
depends=('kdelibs' 'kdebase-workspace')
source=("Eleonora.tar.gz::http://web.archive.org/web/20150806132413/http://kde-look.org/CONTENT/content-files/98341-Eleonora.tar.gz")
sha256sums=('8571e925478cfed8152c1b99b4bcd515b4c0741dea8a2ead0c182a62a070d8d3')

package() {
 install -dm755 ${pkgdir}/usr/share/apps/desktoptheme
 cp -r ${srcdir}/Eleonora ${pkgdir}/usr/share/apps/desktoptheme
 find "${pkgdir}/usr/share/apps/desktoptheme" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr/share/apps/desktoptheme" -type f -exec chmod 644 '{}' \;
}

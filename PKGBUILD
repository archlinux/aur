# Maintainer: FadeMind <fademind@gmail.com>

pkgname=plasma-theme-infinity
pkgver=11.3
pkgrel=2
pkgdesc="Dark-grey plasma theme. Icons from KDE 5 VDG."
arch=('any')
license=('GPL')
url="http://opendesktop.org/content/show.php?content=169134"
depends=('kdelibs' 'kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/169134-Infinity.tar.gz")
sha256sums=('abdff199da0a4099292897770660d822067df26669b81aee2b751282f30c6f20')

package() {
 install -dm755 ${pkgdir}/usr/share/apps/desktoptheme
 cp -r ${srcdir}/Infinity ${pkgdir}/usr/share/apps/desktoptheme
 find "${pkgdir}/usr" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr" -type f -exec chmod 644 '{}' \;
} 

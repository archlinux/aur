# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=flatBlueGray
pkgname=flatbluegray-themes
pkgver=1.0.1
pkgrel=1
pkgdesc="Mod based on visual flatunity but improved. Dark blue combination."
arch=('any')
url="http://opendesktop.org/content/show.php?content=169479"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine' 'gdk-pixbuf2')
source=("${pkgname}-${pkgver}.tar.xz::https://copy.com/TZFgXhIiQi0qqsrx/flatbluegray-themes-1.0.1.tar.xz?download=1")
sha256sums=('6268995d3440072d489dedfd61b4b8a9f771e63885c0989559ff33d5e4c136af')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -rf ${srcdir}/${_pkgname} ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

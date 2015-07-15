# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-aurora
pkgver=3.16
pkgrel=2
pkgdesc="Aurora GNOME Shell,GTK2,GTK3 theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
depends=(gnome-{shell,themes-standard} gtk-{engines,engine-murrine} gdk-pixbuf2)
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/170523-Aurora.tar.gz")
sha256sums=('587014bd318e8dc9461f2f1a7436db2f57356dd680c9f5322df847f40627c758')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -rf Aurora ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-aurora
pkgver=3.16.20150924
pkgrel=1
pkgdesc="Aurora GNOME Shell,GTK2,GTK3 theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
depends=(gnome-{shell,themes-standard} gtk-{engines,engine-murrine} gdk-pixbuf2)
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/170523-Aurora-3.16.tar.gz")
sha256sums=('8ff52fcffdd8f76b596e5dd74788f4ae14a6c6ac4c5b30f01d855470ad3e9710')

package() {
  cd ${srcdir}/Aurora
  install -dm755 ${pkgdir}/usr/share/themes
  cp -rf * ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

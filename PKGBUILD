# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20160324
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('http://gnome-look.org/CONTENT/content-files/174348-Numix-SX.tar.gz')
md5sums=('d4af3806c9f90c6e84b3293fcf82497c')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

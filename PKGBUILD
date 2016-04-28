# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20160428
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('http://gnome-look.org/CONTENT/content-files/174348-Numix-SX.tar.gz')
md5sums=('f92d66b8331ffa8f0ca524f2f7849173')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20160506
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')
source=('http://gnome-look.org/CONTENT/content-files/174348-Numix-SX.tar.gz')
md5sums=('4c7d6c71719160e2390cdfc72012afa1')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160505
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx')
source=('Numix-SX-beta.tar.gz::https://drive.google.com/uc?export=download&id=0B_j0gO_cc4rXZlpsOWVyUkNHcGc')
md5sums=('bd1a0cd8a1bc6c5fc4daf5bbfdb5951c')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

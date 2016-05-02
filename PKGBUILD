# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160502
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx')
source=('Numix-SX-beta.tar.gz::https://drive.google.com/uc?export=download&id=0B_j0gO_cc4rXTFc4OWRnOFpmQlk')
md5sums=('49222067dafde3ed5a64c367dc4432cc')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

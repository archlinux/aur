# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160508
pkgrel=2
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx')
source=('Numix-SX-beta.tar.gz::https://docs.google.com/uc?id=0B_j0gO_cc4rXbVdLcHV0NE81Nmc&export=download')
md5sums=('637a104d642b6e969864c7c62691e3f3')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

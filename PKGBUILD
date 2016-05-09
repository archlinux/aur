# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160509
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-SX?content=174348"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx')
source=('Numix-SX-beta.tar.gz::https://docs.google.com/uc?id=0B_j0gO_cc4rXbVdLcHV0NE81Nmc&export=download')
md5sums=('a00e907b30ee5a37c4f1850dca3e2753')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

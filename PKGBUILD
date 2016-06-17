# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160617
pkgrel=1
pkgdesc="[OBSOLETE] Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx')
install=post-install.sh
source=('Numix-SX.tar.gz::https://www.ppload.com/api/files/download?id=1466176163')
md5sums=('5b00c652483de94dee224925edf3f431')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20160617
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')
source=('Numix-SX.tar.gz::https://www.ppload.com/api/files/download?id=1466176163')
md5sums=('5b00c652483de94dee224925edf3f431')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

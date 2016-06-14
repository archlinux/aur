# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20160612
pkgrel=2
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')
source=('Numix-SX.tar.gz::https://www.ppload.com/api/files/download?id=1465521335')
md5sums=('49d830e1f2997a31cedd53a06c1034d1')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

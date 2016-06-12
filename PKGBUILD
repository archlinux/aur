# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx-beta
pkgver=20160612
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome - experimental GTK 3.2 version"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('Numix-SX.tar.gz::https://www.ppload.com/api/files/download?id=1465521335')
md5sums=('49d830e1f2997a31cedd53a06c1034d1')

package() {
  install -d "$pkgdir/usr/share/themes"

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20170424
pkgrel=1
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')
source=('https://dl.opendesktop.org/api/files/download/id/1493077417/Numix-SX.tar.xz')
md5sums=('e8d2d443b6412a4ab87f0f97f998a543')

package() {
  install -d "$pkgdir/usr/share/themes"
  rm ${srcdir}/Numix-SX.tar.xz

  cp -r ${srcdir}/* "$pkgdir/usr/share/themes/"
}

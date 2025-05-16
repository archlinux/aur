# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=rofi-dmenu
pkgver=2.0.0
pkgrel=2
pkgdesc="Symlink for using Rofi as a drop-in replacement to dmenu"
arch=('any')
provides=(dmenu)
conflicts=(dmenu)
depends=(rofi)

package () {
  install -d "$pkgdir/usr/bin"
  ln -s /usr/bin/rofi "$pkgdir/usr/bin/dmenu"
}

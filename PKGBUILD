# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=rofi-dmenu
pkgver=1
pkgrel=1
pkgdesc="Symlink for using Rofi as a drop-in replacement to dmenu"
arch=('any')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=('rofi')
provides=('dmenu')
conflicts=('dmenu')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which rofi) "$pkgdir"/usr/bin/dmenu
}

# vim:set ts=2 sw=2

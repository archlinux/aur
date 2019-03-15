# Maintainer: Tim Kersten <tim io41 * com>

pkgname=bemenu-dmenu
pkgver=1
pkgrel=1
pkgdesc="Symlink for using bemenu as a drop-in replacement to dmenu"
arch=('any')
url="https://github.com/Cloudef/bemenu"
license=('MIT')
depends=('bemenu')
provides=('dmenu')
conflicts=('dmenu')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which bemenu) "$pkgdir"/usr/bin/dmenu
  ln -s $(which bemenu-run) "$pkgdir"/usr/bin/dmenu-run
}

# vim:set ts=2 sw=2

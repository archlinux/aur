# Maintainer: Tim Kersten <tim io41 * com>
# Contributor: gardenapple <gardenapple@posteo.net>

pkgname=bemenu-dmenu
pkgver=2
pkgrel=1
pkgdesc="Symlink for using bemenu as a drop-in replacement to dmenu and dmenu-wayland"
arch=('any')
url="https://github.com/Cloudef/bemenu"
license=('MIT')
depends=('bemenu')
provides=('dmenu' 'dmenu-wayland')
conflicts=('dmenu' 'dmenu-wayland')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/bemenu "$pkgdir"/usr/bin/dmenu
  ln -s /usr/bin/bemenu-run "$pkgdir"/usr/bin/dmenu-run
  ln -s /usr/bin/bemenu "$pkgdir"/usr/bin/dmenu-wl
  ln -s /usr/bin/bemenu-run "$pkgdir"/usr/bin/dmenu-wl_run
}

# vim:set ts=2 sw=2



# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie-menu-compat
pkgver=1.0
pkgrel=3
pkgdesc="Compatibility layer to use widgie-menu as a replacement of bemenu and dmenu"
arch=('any')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
depends=('widgie')
provides=(dmenu bemenu sxmo-dmenu bemenu-wayland bemenu-wlroots bemenu-x11)
conflicts=(dmenu bemenu sxmo-dmenu bemenu-ncurses bemenu-wayland bemenu-wlroots bemenu-x11)
optdepends=()
makedepends=()
source=()

package() {
  depends=("widgie")
  install -d "$pkgdir"/usr/bin
  ln -s "/usr/bin/widgie-menu" "$pkgdir"/usr/bin/dmenu
  ln -s "/usr/bin/widgie-menu-run" "$pkgdir"/usr/bin/dmenu_run
  ln -s "/usr/bin/widgie-menu-path" "$pkgdir"/usr/bin/dmenu_path
  ln -s "/usr/bin/widgie-menu" "$pkgdir"/usr/bin/bemenu
  ln -s "/usr/bin/widgie-menu-run" "$pkgdir"/usr/bin/bemenu-run
}

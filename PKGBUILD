# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-pixel-saver
pkgver=1.9
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/deadalnix/pixel-saver"
license=('unknown')
depends=('gnome-shell' 'xorg-xprop')
install=${pkgname}.install
source=("https://github.com/deadalnix/pixel-saver/archive/${pkgver}.tar.gz")
sha256sums=('f41b0a78f41610dd1b9b42eba956dffa6a3e168984cee232f8b3cc61716c5074')

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"

  cd "${srcdir}/pixel-saver-${pkgver}"
  cp -af "pixel-saver@deadalnix.me" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:

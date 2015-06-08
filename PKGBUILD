# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-pixel-saver
pkgver=1.5
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/deadalnix/pixel-saver"
license=('unknown')
depends=('gnome-shell' 'xorg-xprop')
install=${pkgname}.install
source=("https://github.com/deadalnix/pixel-saver/archive/${pkgver}.tar.gz")
sha256sums=('dbffd28685cc3aa79db1a1fa3d25c67f1a89778018578a8802f332a55a82760b')

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"

  cd "${srcdir}/pixel-saver-${pkgver}"
  cp -af "pixel-saver@deadalnix.me" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:

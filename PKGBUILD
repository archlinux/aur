# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-pixel-saver
pkgver=1.7
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/deadalnix/pixel-saver"
license=('unknown')
depends=('gnome-shell' 'xorg-xprop')
install=${pkgname}.install
source=("https://github.com/deadalnix/pixel-saver/archive/${pkgver}.tar.gz")
sha256sums=('920cff12ec16fa11688603e15887a0e617ac0847b5ac94a32b078925ea9ae9e9')

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"

  cd "${srcdir}/pixel-saver-${pkgver}"
  cp -af "pixel-saver@deadalnix.me" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:

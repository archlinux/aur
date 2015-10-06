# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-pixel-saver
pkgver=1.6
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/deadalnix/pixel-saver"
license=('unknown')
depends=('gnome-shell' 'xorg-xprop')
install=${pkgname}.install
source=("https://github.com/deadalnix/pixel-saver/archive/${pkgver}.tar.gz")
sha256sums=('a8983b1faeb0d8aff388c886b0904611313615511ec5facd6f41005bf55bbcfc')

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"

  cd "${srcdir}/pixel-saver-${pkgver}"
  cp -af "pixel-saver@deadalnix.me" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:

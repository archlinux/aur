# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=gnome-shell-extension-clipboard-indicator-git
_gitname=pixel-saver
pkgver=20161031
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and saves clipboard history"
arch=('any')
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=()
source=('git://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git')
sha256sums=('SKIP')

package() {
  SR="${srcdir}/gnome-shell-extension-clipboard-indicator"
  TG="${pkgdir}/usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com"
  TGDOC="${pkgdir}/usr/share/doc/gnome-clipboard-indicator-git"
  install -d ${TG}
  cp -fr ${SR}/* ${TG}
  install -d ${TGDOC}
  mv ${TG}/*.rst ${TGDOC}
}

# vim:set ts=2 sw=2 et:

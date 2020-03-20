# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=git-gui-menuentry
pkgver=1
pkgrel=1
pkgdesc="Menu entry for GIT gui"
arch=(any)
url="https://git-scm.com/"
license=(LGPL)
depends=('git' 'tk')
source=('Git-Gui.desktop')
sha512sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/applications
  cp Git-Gui.desktop ${pkgdir}/usr/share/applications
}

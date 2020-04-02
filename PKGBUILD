# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=file-roller-kde-menuentry
pkgver=1
pkgrel=1
pkgdesc="Menu entry for File Roller patched for working in KDE"
arch=(any)
url="http://fileroller.sourceforge.net/"
license=(LGPL)
depends=('file-roller')
source=('KDE-FileRoller.desktop')
sha512sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/applications
  cp KDE-FileRoller.desktop ${pkgdir}/usr/share/applications
}

# Maintainer: Sterophonick
pkgname=flashgbx-desktop
_pkgname='flashgbx-desktop'
pkgver=1
pkgrel=1
pkgdesc='Desktop entries for FlashGBX'
arch=(any)
source=(flashgbx.desktop
        flashgbx.png)
md5sums=('SKIP'
         'SKIP')

package() {
  install -Dm644 flashgbx.desktop $pkgdir/usr/share/applications/flashgbx.desktop
  install -Dm644 flashgbx.png $pkgdir/usr/share/pixmaps/flashgbx.png
}

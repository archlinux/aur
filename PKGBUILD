# Maintainer: terrason <jterraghost@gmail.com>

pkgname=pick-photo-helper
pkgver=0.1.0
pkgrel=1
pkgdesc="挑挑拣拣 — A GNOME-integrated photo selection helper for multi-round filtering with Loupe"
arch=('any')
url="https://github.com/terrason/pick-photo-helper"
license=('MIT')
depends=(
  'python'
  'loupe'
  'python-gobject'
  'at-spi2-core'
  'libnotify'
)
optdepends=('zenity: GUI error dialog when no terminal is available')
source=('pick_photo_helper.py')
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/pick_photo_helper.py" "${pkgdir}/usr/bin/pick-photo-helper"
}

# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad-udev"
pkgver=1.0.0
pkgrel=1
pkgdesc="Udev rules for duckypad"
arch=("x86_64")
license=("MIT")
provides=("duckypad-udev")
depends=("udev")
source=("duckypad.rules")
sha512sums=("2d04e8aea1c394dd9a25f6d89b476c802e10b6b2f80518818e90964c92f4bcab4eeef48d0ef82b135caa120d56c701170cfb26fa3e061db8886bf992efa44be1")

package() {
  install -Dm0644 "duckypad.rules" "$pkgdir/etc/udev/rules.d/20-duckyPad.rules"
}

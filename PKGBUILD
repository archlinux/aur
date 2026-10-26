# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad-udev"
pkgver=1.0.0
pkgrel=3
pkgdesc="Udev rules for duckypad"
url="https://github.com/dekuNukem/duckyPad"
arch=("any")
license=("MIT")
source=("duckypad.rules")
sha512sums=('6d535679debb39361c10b5f073e7446d9076fe42cea723659a0b3f273234bc040535da4d7123fe42c426e3a33185abe5b42e8dca7ffa633e8f32088a47277772')

package() {
  install -Dm0644 duckypad.rules "$pkgdir/usr/lib/udev/rules.d/70-duckypad.rules"
}

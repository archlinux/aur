# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=dragonrise-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rules for DragonRise Adaptors'
arch=('any')
license=('GPL')
source=('70-dragonrise.rules')
sha256sums=('c268220b0b4898b2a2bdfc17d9b3bb5de06b21ee78b4a77cec49cf3eaa014fcf')

package() {
	cd "$srcdir"
	install -Dm644 70-dragonrise.rules "$pkgdir"/usr/lib/udev/rules.d/70-dragonrise.rules
}

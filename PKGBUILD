# Maintainer: Pierre Ayoub <pierreay@proton.me>

pkgname=chipwhisperer-udev
pkgver=6.0.0b
pkgrel=1
pkgdesc="ChipWhisperer's udev rules."
arch=(any)
url="https://www.newae.com/chipwhisperer"
license=('Apache-2.0')
install="udev.install"
source=("https://raw.githubusercontent.com/newaetech/chipwhisperer/refs/tags/v${pkgver}/50-newae.rules")
sha256sums=('29bc7124f6b7200b9c307462e095d1ace7215aa8964f05bd6a6dd857f49f6660')

package() {
	install -Dm644 "${srcdir}/50-newae.rules" "${pkgdir}/usr/lib/udev/rules.d/50-newae.rules"
}

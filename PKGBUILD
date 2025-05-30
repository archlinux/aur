# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=invert-micmute-led-udev
pkgver=1.0
pkgrel=2
pkgdesc="udev rule to set the microphone mute led to glow when capture is enabled"
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('GPL-3.0-or-later')
depends=()
source=("99-micmute-led.rules")

package() {
  install -Dm644 "${srcdir}/99-micmute-led.rules" "${pkgdir}/usr/lib/udev/rules.d/99-micmute-led.rules"
}

sha256sums=('a21b9b95904dd22fdf4eadd91967a887fa96198f9f9e08b97904406aceb1e00b')

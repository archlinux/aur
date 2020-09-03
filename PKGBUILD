# Maintainer: Angelo Dalzotto <angelodalzotto97 at gmail dot com>
pkgname=asrrgb-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Control ASRock's B550 and TRX40 motherboard series RGB LEDs"
arch=('x86_64')
url="https://github.com/aedalzotto/asrrgb"
license=('GPL2')
install="${pkgname}.install"
source=("https://github.com/aedalzotto/asrrgb/releases/download/v$pkgver/asrrgb-v$pkgver.tar.xz")
sha256sums=('fbe2524a19c43fd2cbed7f91c8d2e30c2e8438ec3c989ff3a5f75d7cba5090dc')

package() {
	install -Dm 755 asrrgb "${pkgdir}/usr/bin/asrrgb"
	install -Dm 644 60-asrrgb.rules "${pkgdir}/usr/share/asrrgb/60-asrrgb.rules"
}

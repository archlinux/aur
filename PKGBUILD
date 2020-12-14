# Maintainer: Angelo Dalzotto <angelodalzotto97 at gmail dot com>
pkgname=asrrgb-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Control ASRock's B550 and TRX40 motherboard series RGB LEDs"
arch=('x86_64')
url="https://github.com/aedalzotto/asrrgb"
license=('GPL2')
install="${pkgname}.install"
source=("https://github.com/aedalzotto/asrrgb/releases/download/v$pkgver/asrrgb-v$pkgver.tar.xz")
sha256sums=('43e59660734540b5b90179fb91a7b6b776e9d767b9f7d576bce6c28af9b00f14')

package() {
	install -Dm 755 asrrgb "${pkgdir}/usr/bin/asrrgb"
	install -Dm 644 60-asrrgb.rules "${pkgdir}/usr/share/asrrgb/60-asrrgb.rules"
}

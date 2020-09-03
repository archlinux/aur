# Maintainer: Angelo Dalzotto <angelodalzotto97 at gmail dot com>
pkgname=asrrgb-bin
pkgver=1.0
pkgrel=1
pkgdesc="Control ASRock's B550 and TRX40 motherboard series RGB LEDs"
arch=('x86_64')
url="https://github.com/aedalzotto/asrrgb"
license=('GPL2')
install="${pkgname}.install"
source=("https://github.com/aedalzotto/asrrgb/releases/download/v$pkgver/asrrgb-v$pkgver.tar.xz")
sha256sums=('a54236d5919837f299c9563105a023524c72306ab0523109edb4ba5bc22e7ace')

package() {
	install -Dm 755 asrrgb "${pkgdir}/usr/bin/asrrgb"
	install -Dm 644 60-asrrgb.rules "${pkgdir}/usr/share/asrrgb/60-asrrgb.rules"
}

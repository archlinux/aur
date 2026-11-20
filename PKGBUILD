# Maintainer: czyt <czytcn@gmail.com>
pkgname=blink1-tool-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Command-line tool for controlling blink(1) USB RGB LED"
arch=('x86_64' 'aarch64')
url="https://github.com/todbot/blink1-tool"
license=('custom')
depends=('libusb')
provides=('blink1-tool')
conflicts=('blink1-tool')
source_x86_64=("blink1-tool-x86_64-${pkgver}.zip::https://github.com/todbot/blink1-tool/releases/download/v${pkgver}/blink1-tool-v${pkgver}-linux-x86_64.zip")
source_aarch64=("blink1-tool-aarch64-${pkgver}.zip::https://github.com/todbot/blink1-tool/releases/download/v${pkgver}/blink1-tool-v${pkgver}-linux-aarch64.zip")
sha256sums_x86_64=('858a18bd68fe633fc7d53045e827e8efdcc00e357c440ea1f37b795a1049435e')
sha256sums_aarch64=('138fcebd18182e35f0625dc588382208024f673a5a539768f92922271ea11f46')

package() {
    install -Dm755 blink1-tool "${pkgdir}/usr/bin/blink1-tool"
}

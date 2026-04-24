# Maintainer: czyt <czytcn@gmail.com>
pkgname=blink1-tool-bin
pkgver=2.5.0
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
sha256sums_x86_64=('05f72855816bc5b56cadf96f3d7981c41dfadd4f67b75ac7aec80ef0191bc115')
sha256sums_aarch64=('8e66897a8fc75dffaa27648b9080b389e01ce65fd2d76ec4420b27f8a52487e9')

package() {
    install -Dm755 blink1-tool "${pkgdir}/usr/bin/blink1-tool"
}

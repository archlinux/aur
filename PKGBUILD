# Maintainer: czyt <czytcn@gmail.com>
pkgname=blink1-tiny-server-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Simple HTTP JSON API server to control blink(1) USB RGB LED"
arch=('x86_64' 'aarch64')
url="https://github.com/todbot/blink1-tool"
license=('custom')
depends=('libusb')
provides=('blink1-tiny-server')
conflicts=('blink1-tiny-server')
source_x86_64=("blink1-tiny-server-x86_64-${pkgver}.zip::https://github.com/todbot/blink1-tool/releases/download/v${pkgver}/blink1-tiny-server-v${pkgver}-linux-x86_64.zip")
source_aarch64=("blink1-tiny-server-aarch64-${pkgver}.zip::https://github.com/todbot/blink1-tool/releases/download/v${pkgver}/blink1-tiny-server-v${pkgver}-linux-aarch64.zip")
sha256sums_x86_64=('72f9ecf17e673ef65cb66d9034d85a40fdeb4f662f9fc66b016d403926f13b49')
sha256sums_aarch64=('04f570debfa8fa4b1c742a1b8fb6092234b4f7f77e5b93f3c813ee144aec610e')

package() {
    install -Dm755 blink1-tiny-server "${pkgdir}/usr/bin/blink1-tiny-server"
}

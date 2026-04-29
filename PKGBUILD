# Maintainer: czyt <czytcn@gmail.com>
pkgname=blink1-tiny-server-bin
pkgver=2.5.0
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
sha256sums_x86_64=('5e2339c5dbfdd9535b58f834720438a541294a3bbd57236e4823c3575c073bed')
sha256sums_aarch64=('8ea7d5539931fb86e7e32523a84b70e02cebab603ca7f1a7ec86e2d3162f37f0')

package() {
    install -Dm755 blink1-tiny-server "${pkgdir}/usr/bin/blink1-tiny-server"
}

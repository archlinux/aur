# Maintainer: Jakob Nielsen
pkgname=tztui-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A terminal UI for managing and browsing system timezones"
arch=('x86_64' 'aarch64')
url="https://github.com/jakobnielsen/tztui"
license=('MIT')
provides=('tztui')
conflicts=('tztui')

source_x86_64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_amd64.tar.gz")
source_aarch64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_arm64.tar.gz")
sha256sums_x86_64=('fa2aa5808f34b842f70588706293845cc332a281bedde6f48fe7b82e7c4fdb88')
sha256sums_aarch64=('8b1fe2bce7ea4c014c8e288e0ce69161e0ed9742ed76db568b6ddd12cb27483f')

package() {
    install -Dm755 tztui "${pkgdir}/usr/bin/tztui"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/tztui/README.md"
}

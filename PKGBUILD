# Maintainer: Jakob Nielsen
pkgname=tztui-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="A terminal UI for managing and browsing system timezones"
arch=('x86_64' 'aarch64')
url="https://github.com/jakobnielsen/tztui"
license=('MIT')
provides=('tztui')
conflicts=('tztui')

source_x86_64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_amd64.tar.gz")
source_aarch64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_arm64.tar.gz")
sha256sums_x86_64=('d0b213e5b0404c626e400bf1511d77f3baa208e237655c984796caf13a8b88ef')
sha256sums_aarch64=('225172f2dc4abd057a6a52a78be6e91b660c76698d2ad84edefd218eed3f0e62')

package() {
    install -Dm755 tztui "${pkgdir}/usr/bin/tztui"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/tztui/README.md"
}

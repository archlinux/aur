# Maintainer: Jakob Nielsen
pkgname=tztui-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A terminal UI for managing and browsing system timezones"
arch=('x86_64' 'aarch64')
url="https://github.com/jakobnielsen/tztui"
license=('MIT')
provides=('tztui')
conflicts=('tztui')

source_x86_64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_amd64.tar.gz")
source_aarch64=("https://github.com/jakobnielsen/tztui/releases/download/v${pkgver}/tztui_linux_arm64.tar.gz")
sha256sums_x86_64=('c4f529c8a815160fd896cfa6255aecd41ea048b95ffb0d7efb0ec99066c6759c')
sha256sums_aarch64=('22093c0bbd41e8958c5750f60291615119200359deb73ccf0905fe374db20b73')

package() {
    install -Dm755 tztui "${pkgdir}/usr/bin/tztui"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/tztui/README.md"
}

# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-tui-bin
pkgver=0
pkgrel=1
pkgdesc="Terminal UI for unbill"
arch=('x86_64')
url="https://github.com/patrickli/unbill"
license=('MIT' 'Apache-2.0')
provides=('unbill-tui')
conflicts=('unbill-tui')
source_x86_64=("unbill-tui::https://github.com/patrickli/unbill/releases/download/${pkgver}/unbill-tui-linux-x86_64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/unbill-tui" "${pkgdir}/usr/bin/unbill-tui"
}

# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-tui-nightly-bin
pkgver=nightly.20260613.024210
pkgrel=1
pkgdesc="Terminal UI for unbill (nightly)"
arch=('x86_64')
url="https://github.com/unbill-project/unbill"
license=('MIT' 'Apache-2.0')
depends=('unbill-daemon-nightly')
provides=('unbill-tui')
conflicts=('unbill-tui' 'unbill-tui-bin')
_tag=nightly-20260613-024210
source_x86_64=("unbill-tui::https://github.com/unbill-project/unbill/releases/download/${_tag}/unbill-tui-linux-x86_64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/unbill-tui" "${pkgdir}/usr/bin/unbill-tui"
}

# Maintainer: arosario513
pkgname=oxipass-tui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal-based password manager"
arch=('x86_64' 'aarch64')
url="https://github.com/arosario513/oxipass-tui"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('oxipass-tui')
conflicts=('oxipass-tui')

source=("LICENSE::https://raw.githubusercontent.com/arosario513/oxipass-tui/v${pkgver}/LICENSE")
source_x86_64=("oxipass-tui::https://github.com/arosario513/oxipass-tui/releases/download/v${pkgver}/oxipass-tui-x86_64-unknown-linux-gnu")
source_aarch64=("oxipass-tui::https://github.com/arosario513/oxipass-tui/releases/download/v${pkgver}/oxipass-tui-aarch64-unknown-linux-gnu")
sha256sums=('e1aa170c2892a29d9fb5377cd798b90c773c49d89cd9254fb5e94730cf99380a')
sha256sums_x86_64=('a6e3b35db8fde277b54ca088fa558eabeefae719e690051764cf1a38fba1ebe2')
sha256sums_aarch64=('e96a317c6c6b89bedc77e1bf7898bc6dd855818e25a2b5fbf6d056e47bf84350')

package() {
    install -Dm755 oxipass-tui "${pkgdir}/usr/bin/oxipass-tui"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

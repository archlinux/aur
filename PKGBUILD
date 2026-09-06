# Maintainer: arosario513
pkgname=oxipass-tui-bin
pkgver=1.1.0
pkgrel=2
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
sha256sums_x86_64=('22124342e828bacc74e33e1485f536f1d5367ad66341285d465b23e8aed6584c')
sha256sums_aarch64=('45eebdb7be769003e4a17867c289b3f436582602cc1188a3adeade5f8133cb98')

package() {
    install -Dm755 oxipass-tui "${pkgdir}/usr/bin/oxipass-tui"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

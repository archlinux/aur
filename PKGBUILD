pkgname=tsarr-bin
pkgver=2.11.2
pkgrel=1
pkgdesc="Type-safe TypeScript SDK and CLI for Servarr APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/robbeverhelst/tsarr"
license=('MIT')
provides=('tsarr')
conflicts=('tsarr')
source_x86_64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-x64")
source_aarch64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-arm64")
sha256sums_x86_64=('a75003129fab51e02d3d19b363c60c283c1b1edbd65c4c572a5bc3687b91b243')
sha256sums_aarch64=('547cb6c71c684e4a434e93fd68201973b8e0ca7735b9a60f9b2a888413131f02')

package() {
  install -Dm755 "${srcdir}/tsarr-linux-"* "${pkgdir}/usr/bin/tsarr"
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

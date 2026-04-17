pkgname=tsarr-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Type-safe TypeScript SDK and CLI for Servarr APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/robbeverhelst/tsarr"
license=('MIT')
provides=('tsarr')
conflicts=('tsarr')
source_x86_64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-x64")
source_aarch64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-arm64")
sha256sums_x86_64=('4ad1306cdec1af2a2bdea9d40e58f0e336b250e382521c13c4efbb8ce1460a23')
sha256sums_aarch64=('032718eab4c8900c71f3378c741dcd56f3cb90d2c82bf35138d4dc9f9ba269c0')

package() {
  install -Dm755 "${srcdir}/tsarr-linux-"* "${pkgdir}/usr/bin/tsarr"
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

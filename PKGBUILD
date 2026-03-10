pkgname=tsarr-bin
pkgver=2.4.4
pkgrel=1
pkgdesc="Type-safe TypeScript SDK and CLI for Servarr APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/robbeverhelst/tsarr"
license=('MIT')
provides=('tsarr')
conflicts=('tsarr')
source_x86_64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-x64")
source_aarch64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-arm64")
sha256sums_x86_64=('1b48a918904140c479a09a8fce4653852066e5756167898d4cff9d2369cac55c')
sha256sums_aarch64=('1ed1c355e2d93679660b6ad1c4b794f09ab16a6f15949fbac890692125135eed')

package() {
  install -Dm755 "${srcdir}/tsarr-linux-"* "${pkgdir}/usr/bin/tsarr"
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

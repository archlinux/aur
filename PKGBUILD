pkgname=tsarr-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="Type-safe TypeScript SDK and CLI for Servarr APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/robbeverhelst/tsarr"
license=('MIT')
provides=('tsarr')
conflicts=('tsarr')
source_x86_64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-x64")
source_aarch64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-arm64")
sha256sums_x86_64=('71c11f9621056951a2895de4db9db78033e39651983abec213b674ef4c8c2c5e')
sha256sums_aarch64=('1b63fe05abc78dc9a8827cce7141b5a0222e81d225da4a0bc18b9ecc195330f6')

package() {
  install -Dm755 "${srcdir}/tsarr-linux-"* "${pkgdir}/usr/bin/tsarr"
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

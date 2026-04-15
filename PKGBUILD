pkgname=tsarr-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Type-safe TypeScript SDK and CLI for Servarr APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/robbeverhelst/tsarr"
license=('MIT')
provides=('tsarr')
conflicts=('tsarr')
source_x86_64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-x64")
source_aarch64=("https://github.com/robbeverhelst/tsarr/releases/download/v${pkgver}/tsarr-linux-arm64")
sha256sums_x86_64=('9ad9885e5914f74743bbc25c043f53ea6a5cfb73e9ec48b69742f2026bbbb7d5')
sha256sums_aarch64=('3537ea0905ebd6e9a42efe38c60c43232ad4fc9c7a8ae395ac7f7888901248e4')

package() {
  install -Dm755 "${srcdir}/tsarr-linux-"* "${pkgdir}/usr/bin/tsarr"
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

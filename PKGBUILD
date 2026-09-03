# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-niri
pkgver=0.1.0
pkgrel=5
pkgdesc="Screenshot tool for niri compositor — normal and long/scroll capture with frozen-background selection overlay (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-plain')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('552e73bca25e8bd5af7d1548062c185674ef0b83a2d8d42817d4b6b9f88c2e78')
sha256sums_aarch64=('85f41b8aa2dd3c441f92c2d658481d4c75ede47097e001ffe1aa8992dcca9c42')

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

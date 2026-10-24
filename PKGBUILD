# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-niri
pkgver=0.2.1
pkgrel=1
pkgdesc="Screenshot tool for niri compositor — normal and long/scroll capture with frozen-background selection overlay (prebuilt; x86_64 requires x86-64-v3)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-plain')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('ddb27842484fc5a16843d3405ea0bd6e5f8f67ec3acbeeb85c0e2bbc0a8a8f85')
sha256sums_aarch64=('1be57e788dae2976982e874ee9ebfe862a6a6f1d8271aeb93a1391f686ddf966')

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

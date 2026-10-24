# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-plain
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight wlroots Wayland screenshot tool — plain variant (normal screenshots, supports Niri/Hyprland/Sway/Wayfire/River) (prebuilt; x86_64 requires x86-64-v3)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-niri')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('436faccc18b65b06e89214a990e343fca76cdd52ea3c706fb30d7eed3cf2f912')
sha256sums_aarch64=('f834d128979a266deeea01f27355a7a800189b32387571d9063c6a6fa64a730b')

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

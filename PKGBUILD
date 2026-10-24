# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-plain
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight wlroots Wayland screenshot tool — plain variant (normal screenshots, supports Niri/Hyprland/Sway/Wayfire/River) (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-niri')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('72f5bb225bb3ba87538ea1a5e3e65ac630c8e883bbbc71d12a87d0ee63b3a891')
sha256sums_aarch64=('d026a189d8fc515c290d7b4bdac85e7bb2d510f2ff6b1bcaef955bc2eaea50e0')

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

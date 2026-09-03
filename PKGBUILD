# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-plain
pkgver=0.1.0
pkgrel=4
pkgdesc="Lightweight wlroots Wayland screenshot tool — plain variant (normal screenshots, supports Niri/Hyprland/Sway/Wayfire/River) (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-niri')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('aab92420a16e81691ddf9063d0d68009100df236ee7e97d746675d2c75deff16')
sha256sums_aarch64=('b7bf2eccd7a1f405fd75d81f5da63878469f46762536b15feb2885da2063d5ea')

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

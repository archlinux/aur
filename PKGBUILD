# Maintainer: Qingxu <me@linioi.com>
pkgname=xremap-niri-bin
pkgver=0.14.18
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/xremap/xremap'
arch=(
    'x86_64'
    'aarch64'
)
license=(
    'MIT'
)
provides=(
    'xremap'
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-niri.zip"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-niri.zip"
)
sha256sums_x86_64=('060d5225411f44fdbfaf34be1912b3284655a6fa28fcb09b5fa11a79ceb565e2')
sha256sums_aarch64=('7cd9b0926d0443fc115936b37321c7ffd16c60b1f8172f5f164908f40d9ca4ae')

package() {
    cd "$srcdir/"

    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}

# Maintainer: Qingxu <me@linioi.com>
pkgname=xremap-niri-bin
pkgver=0.14.11
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
sha256sums_x86_64=('14f23ce99990353c9a910791065b64dfdd0cc5c5217ca7f0ce79ac8170b8a580')
sha256sums_aarch64=('525ab80977b5a882541ac70f52657700a4011069c646ca7f115898fd6e0a6926')

package() {
    cd "$srcdir/"

    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}

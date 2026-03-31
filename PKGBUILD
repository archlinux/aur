# Maintainer: Qingxu <me@linioi.com>
pkgname=xremap-niri-bin
pkgver=0.14.19
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
options=(
    '!debug'
)
source=(
    "LICENSE-$pkgver::https://raw.githubusercontent.com/xremap/xremap/v$pkgver/LICENSE"
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-niri.zip"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-niri.zip"
)
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')
sha256sums_x86_64=('e962231233420b3144d6d00e3271dc3f83cb8652829ee38ab1024f00234d32e4')
sha256sums_aarch64=('ee261e6f72d186de37630482cd84dd9f27a03e6d15f94c3154b449321d18a70a')

package() {
    install -Dm755 xremap "$pkgdir/usr/bin/xremap"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

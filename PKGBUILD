# Maintainer: Qingxu <me@linioi.com>
pkgname=xremap-niri-bin
pkgver=0.15.0
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
sha256sums_x86_64=('c23b95b88f61dba585d678035ba3ef25fdc8b9355d66e3927407d8d7ae98f014')
sha256sums_aarch64=('00bd99b59766d5848f3cccc76e69f2d01abc8d79f3b1d994ed10aba7053997c4')

package() {
    install -Dm755 xremap "$pkgdir/usr/bin/xremap"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.14.16
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('100ff88345cf949961ea31ec197656e9b4df8bdfb8adaf376af385e43baa615368309c99d1780d17d361dc920d245e67cc2d734b30195de009438d3a12126ff2')
b2sums_aarch64=('62818060a21980d484ca1054d5ef2889cf0a10f31a92b79ddf32d988a911da75c9779ba64725d4aa655761842df48dc5edc4bef213f10c13856488f46c578008')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

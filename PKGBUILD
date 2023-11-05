# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.8.11
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')
sha256sums_x86_64=('37c4c9798050ec696d3aaff2dab515612aed8d2c3b2cf110ba31fdb43b404ae9')
sha256sums_aarch64=('138bae711326bce58be1d6f07bd2aeff0f0bb7a7573dc0733448dfdacfcf78ad')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.8.18
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')
source=("LICENSE")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('061e03346bd91ddaf4a029ae04f7d003bab7c630e45019fdd733e6f1375f7ab8b0c5a67aed2aab2dfc25efe92bd3dabadb0034c7c30000615d51181aee268193')
b2sums_aarch64=('b7edefd933cdc2f433b3ef332a366fcee660c593179ed6a332987fe746d9435cc7f94555df04d319869e7cd9c0644be2e458ccbef334f5f0d26e1f748cba5b3e')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.14.1
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')
source=("LICENSE")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('403da5d73ec4ab98c27bf8a1232522f4bb59a870f19adac41d45f0aaea8c5495538b8149092355446a4734ea4d19b5302be5207a5cf63255dd1f9540f7fe9992')
b2sums_aarch64=('f8cced22790773e8349b667e686b69307f6edc4ef8c482c00cce9647754f697397048132502d95fc82eeed26874ed9004a379cd557d1e450693975b739aa37c5')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.14.0
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')
source=("LICENSE")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('07b092a860fb82ab2629793f1f672fb4899c07b0d591e34212dd6e3075daded5fe05a963314160a74ba6a301fbff3b897c984943cdf8ce24fb884563fc3fe867')
b2sums_aarch64=('6ec1f3a384811b418c604dfe44a56775c91207287270f2eb961dc3f03d62b9444e0c3fd0f0743dc64590cb2e69692a7cd97590fec89c10fbf5602889f349b9a7')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stitchless
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.3
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('39eb900f29b31dace290d8a6717b9f73e4ffca3ac8a085d06a579d38451e1887e4c0abb947e9bbe22003634586240998a4af8af14e3bebc3ef92552a098b968b')
b2sums_aarch64=('57fca721310700161bd3724f89a8442958a859268468cc4dd4ee3df1827bf16397b0d4846c90280ccdb352aa5fc89db67b1ab5072cfbeff8986e14fd8e470b05')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

package() {
    cd "$srcdir/"
    install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

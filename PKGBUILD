pkgname=cava-bg
pkgver=0.1.9
pkgrel=1
pkgdesc="Audio visualizer for Wayland"
url="https://github.com/leriart/cava-bg"
license=("MIT")
arch=("x86_64")
provides=("cava-bg")
conflicts=("cava-bg")
depends=('cava' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leriart/cava-bg/releases/download/$pkgver/cava-bg-$pkgver-x86_64.tar.gz")
sha256sums=("109bd2a28c61b45a6aa1bc135085be2ad076005296b925033832ed58c6358cfc")

package() {
    cd "$srcdir"
    install -Dm755 "cava-bg" "$pkgdir/usr/bin/cava-bg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/cava-bg/LICENSE"
}

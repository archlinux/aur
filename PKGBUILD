pkgname=cava-bg
pkgver=0.2.0
pkgrel=1
pkgdesc="Audio visualizer for Wayland"
url="https://github.com/leriart/cava-bg"
license=("MIT")
arch=("x86_64")
provides=("cava-bg")
conflicts=("cava-bg")
depends=('cava' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leriart/cava-bg/releases/download/$pkgver/cava-bg-$pkgver-x86_64.tar.gz")
sha256sums=("caf8aaf7fad83ba17dde734388eedf1bceb0b70c62d82b39f22ba2588ececc75")

package() {
    cd "$srcdir"
    install -Dm755 "cava-bg" "$pkgdir/usr/bin/cava-bg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/cava-bg/LICENSE"
}

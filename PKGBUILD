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
sha256sums=("4767d54e7b85d6dd4f971f5054e48c8038b076be71943e40104108bb4cfcdc1a")

package() {
    cd "$srcdir"
    install -Dm755 "cava-bg" "$pkgdir/usr/bin/cava-bg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/cava-bg/LICENSE"
}

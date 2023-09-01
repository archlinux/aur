pkgname=act-bin
pkgver=0.2.50
pkgrel=0
pkgdesc="Run your GitHub Actions locally"
arch=("x86_64")
url="https://github.com/nektos/act"
license=("MIT")
provides=("act")
conflicts=("act")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=("326d7f1c7f7d1f72a062ac6203c5771e32abaf35a8d0628b9323bf5fcbca2ccc")

package() {
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

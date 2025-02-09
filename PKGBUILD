pkgname=act-bin
pkgver=0.2.73
pkgrel=0
pkgdesc="Run your GitHub Actions locally"
arch=("x86_64")
url="https://github.com/nektos/act"
license=("MIT")
provides=("act")
conflicts=("act")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=("b82b06953fe7aa6c63dfa2509bc4acac47ad2f7de85fdb8e1fe4d334c8bbfd0a")

package() {
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

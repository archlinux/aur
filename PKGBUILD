pkgname=act-bin
pkgver=0.2.94
pkgrel=0
pkgdesc="Run your GitHub Actions locally"
arch=("x86_64")
url="https://github.com/nektos/act"
license=("MIT")
provides=("act")
conflicts=("act")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=("33e6748e3c07affb6855f19fb7a28bc6c344c1d0888fae0564e6d34d4a71915a")

package() {
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=act-bin
pkgver=0.2.26
pkgrel=0
pkgdesc="Run your GitHub Actions locally"
arch=("x86_64")
url="https://github.com/nektos/act"
license=("MIT")
provides=("act")
conflicts=("act")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=("da7cea99e2fc3ffa2db3e83a2983fdb20f7228c0c4855a0b7fa74dab40997853")

package() {
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

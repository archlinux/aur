pkgname=act-bin
pkgver=0.2.89
pkgrel=0
pkgdesc="Run your GitHub Actions locally"
arch=("x86_64")
url="https://github.com/nektos/act"
license=("MIT")
provides=("act")
conflicts=("act")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=("0191d6f1f3b716b5c55820032605d05fc3c1cdbf581ebeff655019e5dd1524c0")

package() {
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

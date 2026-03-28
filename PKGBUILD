pkgname=xauwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based live XAU/USD monitor written in Bash"
arch=('any')
url="https://github.com/KlodCripta/xauwatch"
license=('MIT')
depends=('bash' 'curl' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KlodCripta/xauwatch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/xauwatch.sh" "$pkgdir/usr/bin/xauwatch"
}

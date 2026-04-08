pkgname=datafetch
pkgver=2.3
pkgrel=1
pkgdesc="Live system information dashboard for Linux terminals"
arch=('any')
url="https://github.com/KlodCripta/Datafetch"
license=('MIT')
depends=('bash')

source=("$pkgname-$pkgver.tar.gz::https://github.com/KlodCripta/Datafetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/Datafetch-$pkgver/datafetch.sh" "$pkgdir/usr/bin/datafetch"
}

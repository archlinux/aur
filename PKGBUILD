pkgname=rainbowfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="Run fastfetch with automatic logo and colorized output using lolcat"
arch=('any')
url="https://github.com/Stamer-programer/RainbowFetch"
license=('MIT')
depends=('bash' 'fastfetch' 'lolcat')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Stamer-programer/RainbowFetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45790e6df4a3542f21e3dedce17c4a26a829a443d435bd1616dfd43a4c54acc1')

package() {
    cd "$srcdir/RainbowFetch-$pkgver" || exit 1
    install -Dm755 rainbowfetch "$pkgdir/usr/bin/rainbowfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


pkgname=rainbowfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="Run fastfetch with automatic logo and colorized output using lolcat"
arch=('any')
url="https://github.com/Stamer-programer/RainbowFetch"
license=('MIT')
depends=('bash' 'fastfetch' 'lolcat')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Stamer-programer/RainbowFetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d4c5c8d7d85d0cf4e7b0390e6e4cd1c4b12d5f3fe965da5116cd0034388f06c')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rainbowfetch "$pkgdir/usr/bin/rainbowfetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

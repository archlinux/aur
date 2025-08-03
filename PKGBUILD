# Maintainer: therock
pkgname=aurroamer
pkgver=2.0.1
pkgrel=1
pkgdesc="Interactive terminal-based browser for AUR and official packages"
arch=('any')
url="https://github.com/therock444/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/therock444/aurroamer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('302f79d070c5035cb59f51f516beb6ec3bc52487309394ab08616540f1934152')

package() {
  install -Dm755 "$pkgname-$pkgver/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

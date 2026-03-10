# Maintainer: vlensys <monkeeeloll@gmail.com>

pkgname=hyprbole
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal UI for managing Hyprland config"
arch=('any')
url="https://github.com/vlensys/hyprbole"
license=('MIT')
depends=('bash' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 hyprbole.sh "$pkgdir/usr/bin/hyprbole"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

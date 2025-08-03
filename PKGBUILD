# Maintainer: therock
pkgname=aurroamer
pkgver=2.0.1
pkgrel=1
pkgdesc="Interactive terminal-based browser for AUR and official packages"
arch=('any')
url="https://github.com/therock444/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'pacman' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/therock444/aurroamer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d4a417349c1315ad1600bc84850d6022b1a0f6ce8c189cda63b34a33fab3105')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

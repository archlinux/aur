# Maintainer: therock
pkgname=aurroamer
pkgver=2.2.0
pkgrel=2
pkgdesc="Interactive terminal-based browser for AUR and official packages"
arch=('any')
url="https://github.com/therock444/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'pacman' 'gzip')
optdepends=(
  'yay: AUR helper support'
  'paru: AUR helper support'
  'trizen: AUR helper support'
  'pikaur: AUR helper support'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/therock444/aurroamer/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('f7dba7f09b2d339083c0973cbc347687b75b02efdd4b47874ede4c769bfd36b5')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: therock
pkgname=aurroamer
pkgver=2.1.0
pkgrel=3
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
sha256sums=('15ad69f7fb514b5eaa69419caa6723ccfe83e7f0c71b5e18f25fb0bd3508a4c9')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

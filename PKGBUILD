# Maintainer: therock
pkgname=aurroamer
pkgver=2.3.1
pkgrel=1
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
sha256sums=('0963919d41b9fe9e28038d83d24ffac4cc2da9846c571ccca8c32283a0a1c80f')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

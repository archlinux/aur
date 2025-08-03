# Maintainer: therock
pkgname=aurroamer
pkgver=2.1.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/therock444/aurroamer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('792976e64a7f26158fc572edb14975c54d593b71ae5e6db9b7722d7a4a9531e8')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

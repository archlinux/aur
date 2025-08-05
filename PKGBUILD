# Maintainer: therock
pkgname=aurroamer
pkgver=3.0.0
pkgrel=4
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
sha256sums=('146a630a30ac6966a4d0b2466b6f7ada866c49289e3d34eb0f46838a91d55820')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/aurroamer" "$pkgdir/usr/bin/aurroamer"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

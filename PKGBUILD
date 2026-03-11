# Maintainer: Klod Cripta <klodcripta@linux.it>

pkgname=cleaner-advanced
pkgver=2.0
pkgrel=1
pkgdesc="Bash script for system maintenance on Arch Linux and derivatives"
arch=('any')
url="https://github.com/KlodCripta/Cleaner-Advanced"
license=('MIT')
depends=('bash' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/Cleaner-Advanced-$pkgver/cleaner-advanced.sh" \
    "$pkgdir/usr/bin/cleaner-advanced"

  install -Dm644 "$srcdir/Cleaner-Advanced-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/Cleaner-Advanced-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Klod Cripta <KlodCripta@linux.it>

pkgname=distrohelper
pkgver=2.0
pkgrel=1
pkgdesc="Interactive Bash script to help choose a GNU/Linux distribution"
arch=('any')
url="https://github.com/KlodCripta/DistroHelper"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/DistroHelper-$pkgver/distrohelper.sh" \
    "$pkgdir/usr/bin/distrohelper"

  install -Dm644 "$srcdir/DistroHelper-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/DistroHelper-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}

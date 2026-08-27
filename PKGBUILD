# Maintainer: OldJobobo <https://github.com/OldJobobo>
pkgname=jobo-themes
pkgver=0.2.0
pkgrel=1
pkgdesc="Install complete OldJobobo themes through one Omarchy theme manager"
arch=('any')
url="https://github.com/OldJobobo/jobo-themes"
license=('MIT')
depends=('bash' 'curl' 'findutils' 'jq' 'libarchive' 'omarchy' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a98a5b484182eb9d953811723fb2e8fb6ce6351d142107d8297352f28f22f24')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/bin/jobo-themes" \
    "$pkgdir/usr/bin/jobo-themes"
  install -Dm644 "$srcdir/$pkgname-$pkgver/catalog/themes.json" \
    "$pkgdir/usr/share/jobo-themes/catalog.json"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/docs/architecture.md" \
    "$pkgdir/usr/share/doc/$pkgname/architecture.md"
}

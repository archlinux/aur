# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Tool to serve files via HTTP'
provides=('miniserve')
conflicts=('miniserve')
arch=('x86_64')
url='https://github.com/svenstaro/miniserve'
license=(MIT)
source=(
  "miniserve-$pkgver::$url/releases/download/v$pkgver/miniserve-v$pkgver-linux-x86_64"
  "https://github.com/svenstaro/miniserve/raw/v$pkgver/README.md"
  "$url/raw/v$pkgver/LICENSE"
)
sha512sums=(
  SKIP
  SKIP
  SKIP
)

package() {
  install -Dm755 "miniserve-$pkgver" "$pkgdir/usr/bin/miniserve"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

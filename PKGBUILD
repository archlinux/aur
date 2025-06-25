pkgname=rbackup
pkgver=0.2.6
pkgrel=1
pkgdesc="Fast, cross-platform and incremental backup tool written in Rust"
arch=('x86_64')
url="https://github.com/umpire274/rbackup"
license=('MIT')
depends=()
provides=('rbackup')
conflicts=('rbackup')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rbackup-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('cc09bd7e87e08ebb5e7043c225b79682444cdeb24b9c944158f22f8b47aa7651')

package() {
  install -Dm755 "$srcdir/rbackup" "$pkgdir/usr/bin/rbackup"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

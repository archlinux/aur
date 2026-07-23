# Maintainer: Rojit <138610570+Rojit-Timilsena@users.noreply.github.com>
pkgname=aka
pkgver=1.0.0
pkgrel=1
pkgdesc="No-config command/script alias creator"
arch=('any')
url="https://github.com/Rojit-Timilsena/aka"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rojit-Timilsena/aka/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75976caebd1e96e7f7b5684fcfe10292fe0852e8c529e4bd12c2205323768e1d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 aka "$pkgdir/usr/bin/aka"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
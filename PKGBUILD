# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dprint-bin'
pkgver='0.21.1'
pkgrel='1'
pkgdesc='Pluggable and configurable code formatting platform written in Rust.'
arch=('x86_64')
url='https://dprint.dev/'
license=('MIT')
_repo='https://github.com/dprint/dprint'
source=(
  "$pkgver.zip::$_repo/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip"
  "$pkgver.LICENSE::$_repo/raw/$pkgver/LICENSE"
)
sha256sums=(
  'a837571930c8ab334696d67c3a48dc8e88d94a13a8b311da9ce83d20742151d9'
  'SKIP'
)

package() {
  install -Dm755 dprint "$pkgdir/usr/bin/dprint"
  install -Dm644 "$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

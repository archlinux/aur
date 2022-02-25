# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dprint-bin'
pkgver='0.23.0'
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
  '488b0e78e5e607b5ad18ca02cadc55b23ee8ecde214c72881501097ba9b8d17b'
  'SKIP'
)

package() {
  install -Dm755 dprint "$pkgdir/usr/bin/dprint"
  install -Dm644 "$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

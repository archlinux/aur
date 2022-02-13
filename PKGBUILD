# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dprint-bin'
pkgver='0.22.2'
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
  'e57168da7a15efd980bc433afba2815697f51c4708313526fe95a25c83a5ba85'
  'SKIP'
)

package() {
  install -Dm755 dprint "$pkgdir/usr/bin/dprint"
  install -Dm644 "$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

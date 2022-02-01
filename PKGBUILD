# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dprint-bin'
pkgver='0.22.0'
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
  'cf0f87fca34c6f1727da7737b1d8accdb705e8660023d031a35eced91a87aa9f'
  'SKIP'
)

package() {
  install -Dm755 dprint "$pkgdir/usr/bin/dprint"
  install -Dm644 "$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

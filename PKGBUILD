# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dprint-bin'
pkgver='0.9.1'
pkgrel='0'
pkgdesc='Pluggable and configurable code formatting platform written in Rust.'
arch=('x86_64')
url='https://dprint.dev/'
license=('custom')
source=(
  "https://github.com/dprint/dprint/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip"
  'https://github.com/dprint/dprint/raw/master/LICENSE'
)
sha512sums=('SKIP' 'SKIP')

package() {
  install -Dm755 dprint "$pkgdir/usr/bin/dprint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='sfz-bin'
pkgver='0.4.0'
pkgrel='1'
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
provides=('sfz')
conflicts=('sfz')
url='https://github.com/weihanglo/sfz'
license=('Apache' 'MIT')
source=(
  "$url/releases/download/v$pkgver/sfz-v$pkgver-x86_64-unknown-linux-musl.tar.gz"
  "https://github.com/weihanglo/sfz/raw/v$pkgver/LICENSE-APACHE"
  "https://github.com/weihanglo/sfz/raw/v$pkgver/LICENSE-MIT"
)
sha512sums=(
  'SKIP' # for the archive
  'SKIP' # LICENSE-APACHE
  'SKIP' # LICENSE-MIT
)

package() {
  install -Dm755 sfz "$pkgdir/usr/bin/sfz"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

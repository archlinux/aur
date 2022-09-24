# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Szymon Scholz (raspher) <first name last name [at] gmail [dot] com>

pkgname='sfz-bin'
pkgver='0.7.1'
pkgrel='1'
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
provides=('sfz')
conflicts=('sfz')
url='https://github.com/weihanglo/sfz'
license=('Apache' 'MIT')
source=(
  "$url/releases/download/v$pkgver/sfz-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/weihanglo/sfz/raw/v$pkgver/LICENSE-APACHE"
  "https://github.com/weihanglo/sfz/raw/v$pkgver/LICENSE-MIT"
)
md5sums=(
  '08d4d0e69e758103fba6ede4b0e5513b'
  '1836efb2eb779966696f473ee8540542'
  'b93f0f6d6a499152e5538a25abec2dc7'
)

package() {
  install -Dm755 sfz "$pkgdir/usr/bin/sfz"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

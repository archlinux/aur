# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='slap-cli-bin'
pkgver='1.3.1'
pkgrel='1'
pkgdesc='Painless shell argument parsing and dependency check'
arch=('x86_64')
url='https://github.com/agnipau/slap'
license=('Apache' 'MIT')
provides=('slap-cli')
conflicts=('slap-cli')
source=(
  "$url/releases/download/$pkgver/slap-$pkgver-x86_64-unknown-linux-musl.tar.gz"
)
sha512sums=('SKIP')

package() {
  cd "slap-$pkgver-x86_64-unknown-linux-musl"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/LICENSE-MIT"
  install -Dm755 slap "$pkgdir/usr/bin/slap"
}

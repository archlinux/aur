# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
_pkgname=miniserve
pkgver=0.5.0
pkgrel=0
pkgdesc="Tool to serve files via HTTP"
provides=('miniserve')
conflicts=('miniserve')
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
source=(
  ${url}/releases/download/v${pkgver}/miniserve-linux-x86_64
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  SKIP
  SKIP
)

package() {
  install -Dm755 miniserve-linux-x86_64 "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

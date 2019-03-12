# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
_pkgname=miniserve
pkgver=0.3.1
pkgrel=4
pkgdesc="Tool to serve files via HTTP"
provides=('miniserve')
conflicts=('miniserve')
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
source=(
  https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-linux
  https://github.com/svenstaro/miniserve/raw/v${pkgver}/LICENSE
)
sha512sums=(
  '3317c766508c1008b1e8aad61fd9c2b10d75b5c09e32524dd06d5e273690877ed55c836e622dcd730ad3f7af0a7397fd09e05407c6f70f0bf43713218389c672'
  SKIP
)

package() {
  install -Dm755 miniserve-linux "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

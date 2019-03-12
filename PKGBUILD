# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
_pkgname=miniserve
pkgver=0.3.1
pkgrel=2
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
  '0e5f379c28d49033b0e44982fb94b932eb6dbb81a74656776986eb93a6e9135a89b5dc6764ae9e1ee4cc47f09526d7bf96abe0e84d94ba3198590dc3fa43f9e2'
)

package() {
  install -Dm755 miniserve-linux "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

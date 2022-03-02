# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=cleanup-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Remove gone Git branches with ease"
arch=('x86_64')
url="https://github.com/dominikbraun/cleanup"
license=('Apache')
source=("cleanup-v${pkgver}-linux-amd64.tar.gz::https://github.com/dominikbraun/cleanup/releases/download/${pkgver}/cleanup-linux-amd64.tar.gz")
sha256sums=('91d31c7f569d50d72ad7df37d7c3c5ac0fcba467ad57e100206b771ca0549f08')

package() {
  install -Dm 755 "$srcdir/cleanup" "$pkgdir/usr/bin/cleanup"
}

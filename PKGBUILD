pkgname=ton-bin
pkgver=v2023.04
pkgrel=1
pkgdesc="The Open Network"
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/neodiX42/rpm-repo/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgdir"
  tar xf "$srcdir/ton-bin.tar.gz"

  # Fix permissions
  chmod -R go-w "${pkgdir}"
}

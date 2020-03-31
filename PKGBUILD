# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.15.2
pkgrel=1
pkgdesc='Like Git, but for data'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
source=("https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums=('a9ee2c57f426d0c8ea6987b8c90bfd333770d9d76da8c48b71eb9d3c4198a1f7')

package() {
  cd dolt-linux-amd64
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}

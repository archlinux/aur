# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.17.2
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums=('43fa7ad31daf1eb8fd9172d6ded91b0509bf927abe92e6a6cd2fea09f03baaa5')

package() {
  cd dolt-linux-amd64
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
